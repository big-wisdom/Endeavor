/* eslint-disable linebreak-style */
/* eslint-disable max-len */
const {initializeApp} = require("firebase-admin/app");
const {getFirestore, FieldPath} = require("firebase-admin/firestore");
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
    const tempDocData = doc.data();
    if (tempDocData["duration"] != null) { // only keep them if they're schedulable
      tempDocData["events"] = null; // clear schedule of all tasks
      tasks.push({
        id: doc.id,
        data: tempDocData,
      });
    }
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
      // add a work block for the whole duration of the task
      const dStart = new Date(0);
      dStart.setUTCSeconds(timeBlock["start"]["_seconds"]);
      const dEnd = new Date(dStart.getTime() + (task["data"]["duration"] * 60 * 1000));

      const newWorkBlock = {
        "start": dStart,
        "end": dEnd,
      };

      if (task["data"]["events"] == null) {
        task["data"]["events"] = [newWorkBlock];
      } else {
        task["data"]["events"].push(newWorkBlock);
      }

      // cut duration of task off the front of timeBlock
      timeBlock["start"]["_seconds"] += task["data"]["duration"] * 60;
      timeBlock["duration"] = timeBlock["end"] - timeBlock["start"];
      taskIndex++; // move onto next task
    } else if (task["data"]["minnimumSchedulingDuration"] <= timeBlock["duration"]/60) {
      // else if minnimumSchedulingDuration fits inside timeblock
      // add a work block for it
      const dStart = new Date(0);
      dStart.setUTCSeconds(timeBlock["start"]["_seconds"]);
      const dEnd = new Date(dStart.getTime() + (task["data"]["minnimumSchedulingDuration"] * 60 * 1000));
      const newWorkBlock = {
        "start": dStart,
        "end": dEnd,
      };

      if (task["data"]["events"] == null) {
        task["data"]["events"] = [newWorkBlock];
      } else {
        task["data"]["events"].push(newWorkBlock);
      }
      // reduce duration
      task["data"]["duration"] -= task["data"]["minnimumSchedulingDuration"];
      // move onto the next timeblock
      blockIndex++;
      // cut duration of minnimumSchedulingDuration off the front of timeblock
      timeBlock["start"]["_seconds"] += task["data"]["minnimumSchedulingDuration"] * 60;
      timeBlock["duration"] = timeBlock["end"] - timeBlock["start"];
    } else {
      blockIndex++; // move onto next timeBlock
    }
  }

  // affect changes in the docs
  const batch = firestore.batch();
  for (const task of tasks) {
    const docRef = firestore.collection("users").doc(userId).collection("tasks").doc(task["id"]);
    batch.update(docRef, {"events": task["data"]["events"]});
  }
  batch.commit();
});

exports.deleteThisAndFollowingCalendarEvents = functions.https.onCall(async (data, context) => {
  const docSnapList = await getThisAndFollowingCalendarEventSnaps(data["userId"], data["repeatingCalendarEventId"], data["selectedCalendarEventId"]);

  // delete them
  const batch = firestore.batch();
  docSnapList.forEach((doc) => batch.delete(doc.ref));
  await batch.commit();
});

exports.editThisAndFollowingCalendarEvents = functions.https.onCall(async (data, context) => {
  const docSnapList = await getThisAndFollowingCalendarEventSnaps(data["userId"], data["repeatingCalendarEventId"], data["selectedCalendarEventId"]);
  // turn milliseconds back into a date object before passing it to firestore
  const startAsDate = new Date(0);
  const endAsDate = new Date(0);
  startAsDate.setTime(data.data.start);
  endAsDate.setTime(data.data.end);
  data.data.start = startAsDate;
  data.data.end = endAsDate;

  // edit them according to changes made
  const batch = firestore.batch();
  docSnapList.forEach((docSnap) => {
    // We want to make sure that time changes don't shift date, only time
    // copy incoming data
    const copyOfIncomingData = Object.assign({}, data.data);
    // get current start and end
    const currentData = docSnap.data();
    // adjust current hours and minutes to incoming hours and minutes
    const currentStart = new Date(0);
    const currentEnd = new Date(0);
    currentStart.setTime(currentData["start"]["_seconds"]*1000);
    currentEnd.setTime(currentData["end"]["_seconds"]*1000);
    currentStart.setHours(copyOfIncomingData["start"].getHours());
    currentEnd.setHours(copyOfIncomingData["end"].getHours());
    currentStart.setMinutes(copyOfIncomingData["start"].getMinutes());
    currentEnd.setMinutes(copyOfIncomingData["end"].getMinutes());
    // set copy of incoming to that value
    copyOfIncomingData["start"] = currentStart;
    copyOfIncomingData["end"] = currentEnd;

    // update with adjusted data
    batch.update(docSnap.ref, copyOfIncomingData);
  });
  await batch.commit();
});

exports.deleteThisAndFollowingEndeavorBlocks = functions.https.onCall(async (data, context) => {
  const docSnapList = await getThisAndFollowingEndeavorBlockSnaps(data["userId"], data["repeatingEndeavorBlockId"], data["selectedEndeavorBlockId"]);

  // delete them
  const batch = firestore.batch();
  docSnapList.forEach((doc) => batch.delete(doc.ref));
  await batch.commit();
});

/**
 * gets the selected and following calendar event document snapshots
 * @param {string} userId the current user's id
 * @param {string} repeatingCalendarEventId the id to query
 * @param {string} selectedCalendarEventId the calendar event to start from
 */
async function getThisAndFollowingCalendarEventSnaps(userId, repeatingCalendarEventId, selectedCalendarEventId) {
  // grab all relevant calendar events in order
  const repeatingCalendarEventDocSnap = await firestore
      .doc(`users/${userId}/repeatingCalendarEvents/${repeatingCalendarEventId}`).get();
  const repeatingCalendarEventData = repeatingCalendarEventDocSnap.data();
  try {
    const selectedCalendarEventDocSnap = await firestore.doc(`users/${userId}/calendarEvents/${selectedCalendarEventId}`).get();
    const selectedCalendarEventData = selectedCalendarEventDocSnap.data();
    const selectedStart = selectedCalendarEventData["start"];
    const calendarEventsQuerySnapshot = await firestore
        .collection(`users/${userId}/calendarEvents`)
        .where(FieldPath.documentId(), "in", repeatingCalendarEventData["calendarEventIds"])
        .get();
    // I'm going to have to sort and filter them without the help of firestore due to indexing
    const docs = calendarEventsQuerySnapshot.docs;
    docs.sort((a, b) => a.data().start - b.data().start);
    const filteredDocs = docs.filter((doc) => doc.data().start >= selectedStart);
    return filteredDocs;
  } catch (error) {
    console.error(`Error getting repeating calendar events: ${error}`);
  }
}

/**
 * gets the selected and following endeavorBlock document snapshots
 * @param {string} userId the current user's id
 * @param {string} repeatingEndeavorBlockId the id to query
 * @param {string} selectedEndeavorBlockId the endeavor block to start from
 */
async function getThisAndFollowingEndeavorBlockSnaps(userId, repeatingEndeavorBlockId, selectedEndeavorBlockId) {
  // grab all relevant endeavorBlocks in order
  const repeatingEndeavorBlockDocSnap = await firestore
      .doc(`users/${userId}/repeatingEndeavorBlocks/${repeatingEndeavorBlockId}`).get();
  const repeatingEndeavorBlockData = repeatingEndeavorBlockDocSnap.data();
  try {
    const selectedEndeavorBlockDocSnap = await firestore.doc(`users/${userId}/endeavorBlocks/${selectedEndeavorBlockId}`).get();
    const selectedEndeavorBlockData = selectedEndeavorBlockDocSnap.data();
    const selectedStart = selectedEndeavorBlockData["start"];
    const endeavorBlocksQuerySnapshot = await firestore
        .collection(`users/${userId}/endeavorBlocks`)
        .where(FieldPath.documentId(), "in", repeatingEndeavorBlockData["endeavorBlockIds"])
        .get();
    // I'm going to have to sort and filter them without the help of firestore due to indexing
    const docs = endeavorBlocksQuerySnapshot.docs;
    docs.sort((a, b) => a.data().start - b.data().start);
    const filteredDocs = docs.filter((doc) => doc.data().start >= selectedStart);
    return filteredDocs;
  } catch (error) {
    console.error(`Error getting repeating endeavor blocks: ${error}`);
  }
}

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
