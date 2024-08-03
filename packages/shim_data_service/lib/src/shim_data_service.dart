import 'package:grpc_data_service/grpc_data_service.dart';
import 'package:shim_data_service/src/endeavor/endeavor_data_service.dart';
import 'package:shim_data_service/src/week_view_event/week_view_event_service.dart';
import './tasks/tasks_data_service.dart';
import './calendar_event/calendar_event_data_service.dart';
import './endeavor_block/endeavor_block_data_service.dart';

class ShimDataService {
  // initialize data service
  static initialize({required String userId}) {
    GRPCDataService().init(userId);
  }

  // Static aggregates
  static TasksDataService tasks = TasksDataService();
  static EndeavorBlockDataService endeavorBlocks = EndeavorBlockDataService();
  static CalendarEventDataService calendarEvents = CalendarEventDataService();
  static EndeavorDataService endeavors = EndeavorDataService();
  static WeekViewEventDataService weekViewEvents = WeekViewEventDataService();
}
