import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/event/event.dart';

class EndeavorBlock {
  String? id;
  String? endeavorId;
  EndeavorBlockType? type;
  String? repeatingEndeavorBlockId;
  Event? event;

  EndeavorBlock(
      {this.id,
      this.endeavorId,
      this.type,
      this.event,
      this.repeatingEndeavorBlockId});

  EndeavorBlock.fromDocSnap(
      {required Map<String, dynamic> docSnapData, required String this.id}) {
    endeavorId = docSnapData['endeavorId'];
    type = EndeavorBlockType.values
        .firstWhere((t) => t.toString() == docSnapData['type']);
    if (type == EndeavorBlockType.repeating) {
      repeatingEndeavorBlockId = docSnapData['repeatingEndeavorBlockId'];
    }
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
        // this statement makes sure that there is a repeating endeavor block id
        // if and only if it is of the repeating type
        ((type == EndeavorBlockType.single) ==
            (repeatingEndeavorBlockId == null)) &&
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
