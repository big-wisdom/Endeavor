import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:server_data_models/server_data_models.dart';

extension TaskTransformers on Task {
  static final serverTasksToEndeavorlessTasksTransformer =
      StreamTransformer<List<ServerTask>, List<Task>>.fromHandlers(
    handleData: (data, sink) {
      sink.add(
        data
            .where((serverTask) => serverTask.endeavorId == null)
            .map(
              (endeavorlessServerTask) => Task(
                id: endeavorlessServerTask.id,
                title: endeavorlessServerTask.title,
                duration: endeavorlessServerTask.duration,
                events: endeavorlessServerTask.events
                    ?.map((serverEvent) => Event.fromServerEvent(serverEvent))
                    .toList(),
              ),
            )
            .toList(),
      );
    },
  );
}
