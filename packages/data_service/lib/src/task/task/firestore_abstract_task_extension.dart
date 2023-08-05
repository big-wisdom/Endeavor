import 'package:data_models/data_models.dart';
import 'package:data_service/src/task/server_task/server_task_database_fields.dart';

extension FirestoreAbstractTaskExtension on AbstractTask {
  Map<String, dynamic> toDocData() {
    return {
      ServerTaskDatabaseFields.title.string(): title,
      ServerTaskDatabaseFields.endeavorId.string(): endeavorReference?.id,
      ServerTaskDatabaseFields.duration.string(): duration?.inMinutes,
      ServerTaskDatabaseFields.divisible.string(): divisible,
      ServerTaskDatabaseFields.minnimumSchedulingDuration.string():
          minnimumSchedulingDuration?.inMinutes,
      ServerTaskDatabaseFields.events.string():
          events?.map((e) => e.toDocData()).toList(),
    };
  }
}
