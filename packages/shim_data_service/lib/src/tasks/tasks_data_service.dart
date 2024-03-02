import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';

class TasksDataService {
  static Stream<List<ServerTask>> get tasksStream =>
      TasksDataServiceExtension.tasksStream;

  static void createTask(UnidentifiedTask task) {
    TasksDataServiceExtension.createTask(task);
  }

  static void deleteTask(TaskReference taskReference) {
    TasksDataServiceExtension.deleteTask(taskReference);
  }

  static void updateTask(UnidentifiedTask unidentifiedTask, String id) {
    TasksDataServiceExtension.updateTask(unidentifiedTask, id);
  }
}
