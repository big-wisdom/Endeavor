import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class RepeatingEndeavorBlockDataService {
  void createRepeatingEndeavorBlock(
    UnidentifiedRepeatingEndeavorBlock repeatingEndeavorBlock,
  ) {
    GRPCDataService.instance.calendarEvents.createRepeatingCalendarEvent(
      UnidentifiedRepeatingCalendarEvent(
        title: repeatingEndeavorBlock.title,
        repeatingEvent: repeatingEndeavorBlock.repeatingEvent,
        endeavorReference: repeatingEndeavorBlock.endeavorReference,
      ),
      isEndeavorBlock: true,
    );
  }

  void editThisAndFollowingEndeavorBlocks({
    required int endeavorBlockId,
    required int repeatingEndeavorBlockId,
    required UnidentifiedEndeavorBlock unidentifiedEndeavorBlock,
  }) async {
    GRPCDataService.instance.calendarEvents.editThisAndFollowingCalendarEvents(
      CalendarEvent(
        id: endeavorBlockId,
        title: unidentifiedEndeavorBlock.title,
        event: unidentifiedEndeavorBlock.event,
        endeavorReference: unidentifiedEndeavorBlock.endeavorReference,
        repeatingCalendarEventId: repeatingEndeavorBlockId,
      ),
      isEndeavorBlock: true,
    );
  }

  void deleteThisAndFollowing({
    required int endeavorBlockId,
  }) async {
    GRPCDataService.instance.calendarEvents
        .deleteThisAndFollowingCalendarEvents(endeavorBlockId);
  }
}
