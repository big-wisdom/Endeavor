import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class TasksDataService {
  // Stream<List<ServerTask>> get tasksStream =>
  //     TasksDataServiceExtension.tasksStream;

  void createTask(UnidentifiedTask task) {
    GRPCDataService.instance.tasks.create(task);
  }

  void deleteTask(TaskReference taskReference) {
    // TasksDataServiceExtension.deleteTask(taskReference);
  }

  void updateTask(UnidentifiedTask unidentifiedTask, int id) {
    // TasksDataServiceExtension.updateTask(unidentifiedTask, id);
  }
}
