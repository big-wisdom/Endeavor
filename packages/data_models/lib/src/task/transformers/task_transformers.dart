import 'package:data_models/data_models.dart';
import 'package:server_data_models/server_data_models.dart';

extension TaskTransformers on Task {
  static List<Task> taskListFromIngredients(
    List<ServerTask> serverTasks,
    List<ServerEndeavor> serverEndeavors,
  ) {
    return serverTasks.where((serverTask) => serverTask.endeavorId == null).map(
      (endeavorlessServerTask) {
        // TODO: make this more efficient
        EndeavorReference? endeavorReference;
        if (endeavorlessServerTask.endeavorId != null) {
          final relatedServerEndeavor = serverEndeavors.firstWhere(
            (se) => se.id == endeavorlessServerTask.endeavorId,
          );
          endeavorReference = EndeavorReference(
            id: relatedServerEndeavor.id,
            title: relatedServerEndeavor.title,
          );
        }

        return Task(
          id: endeavorlessServerTask.id,
          title: endeavorlessServerTask.title,
          endeavorReference: endeavorReference,
          duration: endeavorlessServerTask.duration,
          minnimumSchedulingDuration:
              endeavorlessServerTask.minnimumSchedulingDuration,
          events: endeavorlessServerTask.events
              ?.map((serverEvent) => Event.fromServerEvent(serverEvent))
              .toList(),
          dueDate: endeavorlessServerTask.dueDate,
          divisible: endeavorlessServerTask.divisible,
        );
      },
    ).toList();
  }
}
