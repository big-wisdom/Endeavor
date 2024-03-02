import 'package:cached_query/cached_query.dart';
import 'package:data_models/data_models.dart';
import 'package:http/http.dart' as http;

class CalendarEventDataService {
  createCalendarEvent(UnidentifiedCalendarEvent calendarEvent) async {
    final query = Query(
      key: "createEvent",
      queryFn: () => http.post(
        Uri.parse('http://localhost:8080/events'),
        body: calendarEvent.toSqlJson(),
      ),
    );

    final result = await query.result;
    print(result);

    return result;
  }
}
