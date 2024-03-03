import 'dart:convert';

import 'package:cached_query/cached_query.dart';
import 'package:cached_query_data_service/cached_query_data_service.dart';
import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:http/http.dart' as http;

class CalendarEventDataService {
  createCalendarEvent(UnidentifiedCalendarEvent calendarEvent) async {
    final query = Query(
      key:
          "createEvent-${calendarEvent.event.start.toSqlString()}-${calendarEvent.event.end.toSqlString()}",
      queryFn: () => http.post(Uri.parse('http://192.168.1.49:8080/events'),
          body: jsonEncode(
              calendarEvent.toSqlJson(CachedQueryDataService.userId)),
          headers: {'Content-Type': "application/json"}),
    );

    final result = await query.result;

    return result;
  }
}
