import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';

class TasksDataService {
  Stream<List<ServerTask>> get tasksStream =>
      TasksDataServiceExtension.tasksStream;

  void createTask(UnidentifiedTask task) {
    TasksDataServiceExtension.createTask(task);
  }

  void deleteTask(TaskReference taskReference) {
    TasksDataServiceExtension.deleteTask(taskReference);
  }

  void updateTask(UnidentifiedTask unidentifiedTask, String id) {
    TasksDataServiceExtension.updateTask(unidentifiedTask, id);
  }
}
