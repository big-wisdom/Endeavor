import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class WeekViewEventDataService {
  Stream<QueryState<List<WeekViewEvent>>> eventStream =
      GRPCDataService.instance.calendarEvents.weekViewEvents;
}
