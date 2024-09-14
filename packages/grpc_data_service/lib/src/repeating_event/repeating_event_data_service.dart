import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/generated_protos/common_models/repeating_event.pb.dart'
    as Proto;
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';
import 'package:flutter/material.dart' show TimeOfDay;

class RepeatingCalendarEventDataService {
  Query<List<Proto.RepeatingEvent>> _query;

  static const repeatingEventsQueryKey = "repeatingEvents";

  RepeatingCalendarEventDataService(EndeavorClient client, String userId)
      : _query = Query(
          key: repeatingEventsQueryKey,
          queryFn: () {
            return client
                .listRepeatingEvents(ListRepeatingEventsRequest(userId: userId))
                .then((listRepeatingEventsResponse) {
              return listRepeatingEventsResponse.repeatingEvents;
            });
          },
        );

  Stream<QueryState<List<RepeatingCalendarEvent>>> get stream =>
      _query.stream.map(
        (qs) => QueryState(
          timeCreated: DateTime.now(),
          data: qs.data
              ?.where((re) => !re.isEndeavorBlock)
              .map(
                (re) => RepeatingCalendarEvent(
                  id: re.id,
                  title: re.title,
                  repeatingEvent: RepeatingEvent(
                    startDate: DateTime(re.startDate.year, re.startDate.month,
                        re.startDate.day),
                    endDate: DateTime(
                        re.endDate.year, re.endDate.month, re.endDate.day),
                    startTime: TimeOfDay(
                        hour: re.startTime.hours, minute: re.startTime.minutes),
                    endTime: TimeOfDay(
                        hour: re.endTime.hours, minute: re.endTime.minutes),
                    daysOfWeek: [re.m, re.t, re.w, re.th, re.f, re.s, re.su],
                  ),
                ),
              )
              .toList(),
        ),
      );
}
