import 'package:authentication_repository/authentication_repository.dart';
import 'package:data_service/data_service.dart';
import 'package:shim_data_service/src/endeavor/endeavor_data_service.dart';
import './user_document/user_document_data_service.dart';
import './tasks/tasks_data_service.dart';
import './calendar_event/calendar_event_data_service.dart';
import './endeavor_block/endeavor_block_data_service.dart';

abstract class ShimDataService {
  // initialize data service
  static initialize(Stream<User> userStream) {
    DataService(userStream);
  }

  // Static aggregates
  static UserDocumentDataService userDocument = UserDocumentDataService();
  static TasksDataService tasks = TasksDataService();
  static EndeavorBlockDataService endeavorBlocks = EndeavorBlockDataService();
  static CalendarEventDataService calendarEvents = CalendarEventDataService();
  static EndeavorDataService endeavors = EndeavorDataService();
}
