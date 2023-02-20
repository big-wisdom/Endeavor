import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/event.dart';

class OneTimeEndeavorBlock extends EndeavorBlock {
  Event? event;

  OneTimeEndeavorBlock({this.event}) : super(type: EndeavorBlockType.single);

  OneTimeEndeavorBlock.fromDocSnap(Map<String, dynamic> docSnapData)
      : super(
          endeavorId: docSnapData['endeavorId'],
          type: EndeavorBlockType.single,
        ) {
    event = Event(
      start: DateTime.parse(docSnapData['start']),
      end: DateTime.parse(docSnapData['end']),
    );
  }

  @override
  bool validate() {
    return event != null && event!.validate();
  }
}
