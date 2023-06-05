import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

extension EndeavorsData on DataRepository {
  void changeSettings(EndeavorSettings newSettings, String endeavorId) {
    if (firestore != null) {
      firestore!
          .collection('settings')
          .doc(endeavorId)
          .update(newSettings.toData());
    } else {
      throw Exception("No User! Cant change settings if there's no user");
    }
  }

  Stream<EndeavorSettings> endeavorSettingsStream(Endeavor endeavor) {
    if (firestore != null) {
      return firestore!
          .collection('settings')
          .doc(endeavor.id)
          .snapshots()
          .map<EndeavorSettings>((docSnap) {
        if (docSnap.data() != null) {
          return EndeavorSettings.fromDocSnapData(
              data: docSnap.data()!, id: docSnap.id);
        } else {
          throw Exception("this settings doc has no data");
        }
      });
    } else {
      throw Exception("No user! Can't get data without a user ya silly goose!");
    }
  }

  Stream<List<EndeavorSettings>> allEndeavorSettingsStream() {
    if (firestore != null) {
      return firestore!.collection('settings').snapshots().map((querysnap) {
        List<EndeavorSettings> settingsList = [];
        for (final doc in querysnap.docs) {
          settingsList.add(
            EndeavorSettings.fromDocSnapData(
              id: doc.id,
              data: doc.data(),
            ),
          );
        }
        return settingsList;
      });
    } else {
      throw Exception("No user! Can't get data without a user ya silly goose!");
    }
  }

  Stream<Endeavor> endeavorStream(Endeavor endeavor) {
    if (firestore != null) {
      return firestore!
          .collection('endeavors')
          .doc(endeavor.id)
          .snapshots()
          .map((docSnap) {
        if (docSnap.data() != null) {
          return Endeavor.fromDocData(id: docSnap.id, data: docSnap.data()!);
        } else {
          throw Exception("No Data!");
        }
      });
    } else {
      throw Exception("No user! Can't get data");
    }
  }

  Stream<List<Endeavor>> primaryEndeavorStream() async* {
    if (firestore != null) {
      final userDocSnap = await firestore!.get();
      final docSnapData = userDocSnap.data();
      if (docSnapData != null) {
        final primaryEndeavorIds = (docSnapData['primaryEndeavorIds'] as List)
            .map((primaryEndeavorId) => primaryEndeavorId as String);
        final primaryEndeavorsStream = await firestore!
            .collection('endeavors')
            .where(FieldPath.documentId, whereIn: primaryEndeavorIds)
            .snapshots()
            .map<List<Endeavor>>((querySnap) {
          return querySnap.docs.map((docSnap) {
            return Endeavor.fromDocData(id: docSnap.id, data: docSnap.data());
          }).toList();
        });
        yield* primaryEndeavorsStream;
      } else {
        // TODO: do something when there is no primary endeavor data yet
      }
    } else {
      throw Exception("No user! Cant get data");
    }
  }

  void createPrimaryEndeavor(Endeavor endeavor) async {
    if (firestore == null) {
      throw Exception("No user! Can't create endeavor.");
    }
    // Create endeavor document
    final endeavorDocRef =
        await firestore!.collection("endeavors").add(endeavor.toData());
    await firestore!.collection('settings').doc(endeavorDocRef.id).set({});

    /// Reference it under primary endeavors in the user doc
    // get user doc
    final userDocSnap = await firestore!.get();
    // get current list
    final docData = userDocSnap.data()!;
    var primaryEndeavorIds = docData['primaryEndeavorIds'];
    Map<String, dynamic> newData;
    if (primaryEndeavorIds == null) {
      // if no list create one with one entry
      newData = {
        "primaryEndeavorIds": [endeavorDocRef.id]
      };
    } else {
      // if there is a list update it locally then on firebase
      primaryEndeavorIds =
          (primaryEndeavorIds as List).map((id) => id as String).toList();
      primaryEndeavorIds.add(endeavorDocRef.id);
      newData = {
        "primaryEndeavorIds": primaryEndeavorIds,
      };
    }
    firestore!.update(newData);
  }

  void updateEndeavor(Endeavor endeavor) async {
    if (firestore == null) {
      throw Exception("No user! Can't update endeavor.");
    }

    await firestore
        ?.collection("endeavors")
        .doc(endeavor.id)
        .update(endeavor.toData());
  }

  void deleteEndeavor(Endeavor endeavor) {
    // get doc ref
    firestore?.collection('endeavors').doc(endeavor.id).delete();
  }
}
