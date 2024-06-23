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
                  ..add(ListEventsRequest(
                      userId:
                          userId))) // TODO: see if we can make this server side streaming only
                .stream)
            .map((resp) => resp.events
                .map(
                  (e) => WeekViewEvent(
                    title: e.title,
                    backgroundColor: Color(e.color),
                    start: e.startTime.toDateTime(),
                    end: e.endTime.toDateTime(),
                    isEndeavorBlock: e.isEndeavorBlock,
                    taskId: e.taskId,
                  ),
                )
                .toList());
}
