import 'dart:async';
import 'dart:ui';

import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class WeekViewEventDataService {
  EndeavorClient client;
  // String _userId;
  Stream<List<WeekViewEvent>> eventsStream;

  WeekViewEventDataService(this.client, String userId)
      : eventsStream = client
            .subscribeToEvents((StreamController<ListEventsRequest>()
                  ..add(
                    ListEventsRequest(
                      userId: userId,
                    ),
                  )) // TODO: see if we can make this server side streaming only
                .stream)
            .map((resp) => resp.events
                .map(
                  (e) => WeekViewEvent(
                    id: e.id,
                    title: e.title,
                    endeavorReference: EndeavorReference(
                      title: e.endeavorReference.title,
                      id: e.endeavorReference.id,
                    ),
                    repeatingEventId:
                        e.repeatingEventId == 0 ? null : e.repeatingEventId,
                    backgroundColor: e.color == 0 ? null : Color(e.color),
                    start: e.startTime.toDateTime(toLocal: true),
                    end: e.endTime.toDateTime(toLocal: true),
                    isEndeavorBlock: e.isEndeavorBlock,
                    taskId: e.taskId == 0 ? null : e.taskId,
                  ),
                )
                .toList());
}
