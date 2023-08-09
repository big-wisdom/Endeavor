import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:server_data_models/server_data_models.dart';
import 'package:collection/collection.dart';

extension TasksDataRepositoryExtension on DataRepository {
  static Task taskFromStreams(List<ServerEndeavor> serverEndeavors,
      List<ServerTask> serverTasks, String taskId) {
    final serverTask = serverTasks.firstWhere(
      (st) => st.id == taskId,
    );
    final parentEndeavor = serverEndeavors
        .firstWhereOrNull((se) => se.id == serverTask.endeavorId);
    return Task(
      id: serverTask.id,
      title: serverTask.title,
      endeavorReference: serverTask.endeavorId != null
          ? EndeavorReference(
              title: parentEndeavor!.title, id: parentEndeavor.id)
          : null,
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
