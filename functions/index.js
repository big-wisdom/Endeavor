/* eslint-disable max-len */
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");
initializeApp({projectId: "endeavor-75fc7"});
const firestore = getFirestore();

const functions = require("firebase-functions");
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.planEndeavor = functions.https.onCall(async (data, context) => {
  const endeavorId = data["endeavorId"];
  const userId = data["userId"];


  // get timestamp of right now
  const now = new Date();

  // grab all relevant endeavorBlocks in order
  const endeavorBlocksQuery = await firestore
      .collection(`users/${userId}/endeavorBlocks`)
      .where("endeavorId", "==", endeavorId)
      .orderBy("end")
      .where("end", ">=", now)
      .orderBy("start")
      .get();
  // from that get open time blocks
  const timeBlocks = [];
  for (const doc of endeavorBlocksQuery.docs) {
    const docData = doc.data();

    // if block has already started, chop off what has already passed
    const endeavorBlockStart = docData["start"].toDate();
    if (endeavorBlockStart < now) {
      docData["start"]["_seconds"] += Math.floor((now - endeavorBlockStart) / 1000);
    }

    // add it to timeBlocks
    timeBlocks.push({
      start: docData["start"],
      end: docData["end"],
      duration: docData["end"] - docData["start"],
    });
  }

  // grab all tasks that can be scheduled in order
  const tasksQuery = await firestore
      .collection(`users/${userId}/tasks`)
      .where("endeavorId", "==", endeavorId)
      .get();
  const tasks = [];
  for (const doc of tasksQuery.docs) {
    tasks.push({
      id: doc.id,
      data: doc.data(),
    });
  }

  // grab endeavor doc to order the tasks
  const endeavorDocSnap = await firestore
      .collection(`users/${userId}/endeavors`)
      .doc(endeavorId)
      .get();
  const endeavorData = endeavorDocSnap.data();

  // Sort tasks by endeavorDocTasksList
  tasks.sort(function(a, b) {
    return endeavorData["taskIds"].indexOf(a["id"]) - endeavorData["taskIds"].indexOf(b["id"]);
  });


  // scheduling loop
  let taskIndex = 0;
  let blockIndex = 0;
  while (taskIndex < tasks.length && blockIndex < timeBlocks.length) {
    // get next task and next timeblock
    const task = tasks[taskIndex];
    const timeBlock = timeBlocks[blockIndex];

    // if task fits inside timeblock
    if (task["data"]["duration"] <= timeBlock["duration"]/60) {
      // set start of task to start of block
      const d = new Date(0);
      d.setUTCSeconds(timeBlock["start"]["_seconds"]);
      task["data"]["start"] = d;

      // cut duration of task off the front of timeBlock
      timeBlock["start"]["_seconds"] += task["data"]["duration"] * 60;
      timeBlock["duration"] = timeBlock["end"] - timeBlock["start"];
      taskIndex++; // move onto next task
    } else {
      blockIndex++; // move onto next timeBlock
    }
  }

  // affect changes in the docs
  const batch = firestore.batch();
  for (const task of tasks) {
    const docRef = firestore.collection("users").doc(userId).collection("tasks").doc(task["id"]);
    batch.update(docRef, {"start": task["data"]["start"]});
  }
  batch.commit();
});

exports.endeavorDeleted = functions.firestore
    .document("users/{userId}/endeavors/{endeavorId}")
    .onDelete(async (snapshot, context) => {
      // const deletedValue = snapshot.data();

      // delete all endeavorBlocks associated with this endeavor
      const querySnap = await firestore.collection(`users/${context.params.userId}/endeavorBlocks`).where("endeavorId", "==", context.params.endeavorId).get();
      const batch = firestore.batch();
      for (const doc of querySnap.docs) {
        batch.delete(doc.ref);
      }
      await batch.commit();

      // delete all tasks associated with this endeavor
      const taskQuerySnap = await firestore.collection(`users/${context.params.userId}/tasks`).where("endeavorId", "==", context.params.endeavorId).get();
      const taskBatch = firestore.batch();
      for (const doc of taskQuerySnap.docs) {
        taskBatch.delete(doc.ref);
      }
      await taskBatch.commit();

      return 0;
    });

exports.endeavorBlockDeleted = functions.firestore
    .document("users/{userId}/endeavorBlocks/{endeavorBlockId}")
    .onDelete(async (snapshot, context) => {
      // if it is part of a repeating endeavor, remove it
      const deletedEndeavorBlock = snapshot.data();
      if (deletedEndeavorBlock.repeatingEndeavorBlockId != undefined) {
        const repeatingEndeavorBlockDocRef = firestore.doc(`users/${context.params.userId}/repeatingEndeavorBlocks/${deletedEndeavorBlock.repeatingEndeavorBlockId}`);
        try {
          // I do this as a transaction because transactions are atomic and I can't have them interrupting eachother
          await firestore.runTransaction(async (t) => {
            const doc = await t.get(repeatingEndeavorBlockDocRef);
            if (doc.exists) {
              const endeavorBlockIds = doc.data().endeavorBlockIds;
              const i = endeavorBlockIds.indexOf(context.params.endeavorBlockId);
              if (i >= 0) {
                endeavorBlockIds.splice(i, 1);
                t.update(repeatingEndeavorBlockDocRef, {"endeavorBlockIds": endeavorBlockIds});
              } else {
                functions.logger.info(`list does not contain ${context.params.endeavorBlockId}`);
              }
            } else {
              functions.logger.info("repeating endeavor block doc does not exist");
            }
          });
        } catch (e) {
          functions.logger.error("Transaction to remove endeavorBlockId from repeating endeavor block failed");
        }
      } else {
        functions.logger.info("not part of repeating", {structuredData: true});
        return 1;
      }
    });

exports.repeatingEndeavorUpdated = functions.firestore
    .document("users/{userId}/repeatingEndeavorBlocks/{repeatingEndeavorBlockId}")
    .onUpdate((change, context) => {
      // if repeatingEndeavorBlock is now empty, remove it
      if (change.after.data().endeavorBlockIds.length == 0) change.after.ref.delete();
      return 0;
    });
