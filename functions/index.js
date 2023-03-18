/* eslint-disable max-len */
const admin = require("firebase-admin");
const functions = require("firebase-functions");
admin.initializeApp({projectId: "endeavor-75fc7"});
const firestore = admin.firestore();
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



  // grab all relevant endeavorBlocks in order
  const querySnap = await firestore
      .collection(`users/${userId}/endeavorBlocks`)
      .where("endeavorId", "==", endeavorId)
      .orderBy("start")
      .get();
  // from that get open time blocks
  // grab all tasks that can be scheduled in order

  // go through tasks and timeblocks
  // get next task and next timeblock
  // if both exist
  // if next task fits inside next timeblock
  // schedule task for that time
  // set starting time
  // label as planned
  // cut down the timeblock
  // else
  // move onto the next timeblock
  // else
  // end planning

  // Just a print for right now to get rid of errors
  return `Running plan endeavor for: ${endeavorId} by user: ${userId}`;
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
