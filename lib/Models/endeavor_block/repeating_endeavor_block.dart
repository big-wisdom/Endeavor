import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/event/repeating_event.dart';

class RepeatingEndeavorBlock {
  String? id;
  RepeatingEvent? repeatingEvent;
  List<String>? endeavorBlockIds;
  String? endeavorId;

  RepeatingEndeavorBlock(
      {this.id, this.repeatingEvent, this.endeavorBlockIds, this.endeavorId});

  RepeatingEndeavorBlock.fromDocSnap(
      DocumentSnapshot<Map<String, dynamic>> docSnap) {
    id = docSnap.id;
    Map<String, dynamic>? data = docSnap.data();
    if (data != null) {
      endeavorBlockIds = (data['endeavorBlockIds'] as List)
          .map((blockId) => blockId as String)
          .toList();
    } else {
      throw Exception("Doc Snap came back empty");
    }
  }

  bool validate() {
    return repeatingEvent != null &&
        repeatingEvent!.validate() &&
        endeavorBlocks != null &&
        endeavorId != null;
  }

  Map<String, dynamic>? toDocData() {
    if (endeavorBlockIds != null) {
      return {
        'endeavorBlockIds': endeavorBlockIds,
      };
    } else {
      return null;
    }
  }

  List<EndeavorBlock>? _endeavorBlocks;
  List<EndeavorBlock>? get endeavorBlocks {
    if (_endeavorBlocks != null) return _endeavorBlocks;

    // conditions in which you should calculate it
    if (repeatingEvent != null &&
        repeatingEvent!.validate() &&
        repeatingEvent!.events != null) {
      _endeavorBlocks = repeatingEvent!.events!
          .map((e) => EndeavorBlock(
              repeatingEndeavorBlockId: id,
              endeavorId: endeavorId,
              type: EndeavorBlockType.repeating,
              event: e))
          .toList();
      return _endeavorBlocks;
    } else {
      // otherwise return null
      return null;
    }
  }
}
