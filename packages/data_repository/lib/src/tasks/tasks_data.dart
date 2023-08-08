import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:server_data_models/server_data_models.dart';

extension TasksDataRepositoryExtension on DataRepository {
  static Task taskFromStreams(List<ServerEndeavor> serverEndeavors,
      List<ServerTask> serverTasks, String taskId) {
    final serverTask = serverTasks.firstWhere(
      (st) => st.id == taskId,
    );
    final parentEndeavor = serverEndeavors.firstWhere(
      (se) => se.id == serverTask.endeavorId,
    );
    return Task(
      id: serverTask.id,
      title: serverTask.title,
      endeavorReference:
          EndeavorReference(title: parentEndeavor.title, id: parentEndeavor.id),
      events: serverTask.events
          ?.map((e) => Event(start: e.start, end: e.end))
          .toList(),
      duration: serverTask.duration,
      minnimumSchedulingDuration: serverTask.minnimumSchedulingDuration,
      dueDate: serverTask.dueDate,
      divisible: serverTask.divisible,
    );
  }
}
