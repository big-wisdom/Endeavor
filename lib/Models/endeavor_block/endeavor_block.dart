import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/event.dart';

class EndeavorBlock {
  String? id;
  String? endeavorId;
  EndeavorBlockType? type;
  Event? event;

  EndeavorBlock({this.id, this.endeavorId, this.type, this.event});

  EndeavorBlock.fromDocSnap(
      {required Map<String, dynamic> docSnapData, required String this.id}) {
    endeavorId = docSnapData['endeavorId'];
    event = Event(
      start: DateTime.fromMicrosecondsSinceEpoch(
        (docSnapData['start'] as Timestamp).microsecondsSinceEpoch,
      ),
      end: DateTime.fromMicrosecondsSinceEpoch(
        (docSnapData['end'] as Timestamp).microsecondsSinceEpoch,
      ),
    );
  }

  bool validate() {
    return endeavorId != null &&
        event != null &&
        type != null &&
        event!.validate();
  }

  @override
  bool operator ==(Object other) {
    return other.runtimeType == runtimeType &&
        (other as EndeavorBlock).event == event &&
        other.type == type;
  }

  @override
  int get hashCode => event.hashCode;
}

enum EndeavorBlockType { single, repeating }
