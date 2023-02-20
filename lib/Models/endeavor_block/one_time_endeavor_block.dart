import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/event.dart';

class OneTimeEndeavorBlock extends EndeavorBlock {
  Event? event;

  OneTimeEndeavorBlock({this.event}) : super(type: EndeavorBlockType.single);

  @override
  bool validate() {
    return event != null && event!.validate();
  }
}
