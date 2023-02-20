import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/event.dart';

class OneTimeEndeavorBlock extends EndeavorBlock {
  Event? event;

  OneTimeEndeavorBlock({this.event}) : super(type: EndeavorBlockType.single);

  OneTimeEndeavorBlock.fromDocSnap(
      {required Map<String, dynamic> docSnapData, required String id})
      : super(
          id: id,
          endeavorId: docSnapData['endeavorId'],
          type: EndeavorBlockType.single,
        ) {
    event = Event(
      start: DateTime.fromMicrosecondsSinceEpoch(
        (docSnapData['start'] as Timestamp).microsecondsSinceEpoch,
      ),
      end: DateTime.fromMicrosecondsSinceEpoch(
        (docSnapData['end'] as Timestamp).microsecondsSinceEpoch,
      ),
    );
  }

  @override
  bool validate() {
    return type != null &&
        endeavorId != null &&
        event != null &&
        event!.validate();
  }

  @override
  bool operator ==(Object other) {
    return other.runtimeType == runtimeType &&
        (other as OneTimeEndeavorBlock).type == type &&
        other.event == event;
  }

  @override
  int get hashCode => event.hashCode;
}
