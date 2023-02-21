import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/event/repeating_event.dart';

class RepeatingEndeavorBlock {
  String? id;
  RepeatingEvent? repeatingEvent;
  List<String>? endeavorBlockIds;
  String? endeavorId;

  RepeatingEndeavorBlock({this.id, this.repeatingEvent, this.endeavorBlockIds});

  List<EndeavorBlock>? _endeavorBlocks;
  List<EndeavorBlock>? get endeavorBlocks {
    if (_endeavorBlocks != null) return _endeavorBlocks;

    // TODO: somewhere the repeating event should be validated
    // conditions in which you should calculate it
    if (repeatingEvent != null && repeatingEvent!.events != null) {
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
