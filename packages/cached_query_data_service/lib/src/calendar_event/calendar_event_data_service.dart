import 'dart:convert';

import 'package:cached_query/cached_query.dart';
import 'package:cached_query_data_service/cached_query_data_service.dart';
import 'package:data_models/data_models.dart';
import 'package:http/http.dart' as http;

class CalendarEventDataService {
  createCalendarEvent(
    UnidentifiedCalendarEvent calendarEvent,
    String uuid,
  ) async {
    final calendarEventJson = calendarEvent.toSqlJson(
      CachedQueryDataService.userId,
      uuid,
    );
    print('calendarEventJson: ');
    print(calendarEventJson);

    final myJson = jsonEncode(calendarEventJson);
    print('myJson: ');
    print(myJson);

    final query = Query(
      key: "createEvent-$uuid",
      queryFn: () => http.post(
        Uri.parse('http://192.168.1.67:8080/events'),
        body: myJson,
        headers: {'Content-Type': "application/json"},
      ),
    );

    final result = await query.result;
    print(result.data.toString());

    return result;
  }

  deleteCalendarEvent(String id) async {
    final query = Query(
      key: "event-${id}",
      queryFn: () => http.delete(
        Uri.parse('http://192.168.1.67:8080/events'),
        body: jsonEncode({"userId": CachedQueryDataService.userId, "id": id}),
        headers: {'Content-Type': "application/json"},
      ),
    );

    final result = await query.result;

    return result;
  }
}
