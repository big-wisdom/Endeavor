import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class EndeavorsDataService {
  EndeavorClient client;
  String _userId;
  Stream<List<Endeavor>> endeavorsStream;

  EndeavorsDataService(this.client, String userId)
      : _userId = userId,
        endeavorsStream = client
            .subscribeToEndeavorsStream(
              (StreamController<ListEndeavorsRequest>()
                    ..add(ListEndeavorsRequest(userId: userId)))
                  .stream,
            )
            .asBroadcastStream()
            .map((listCalendarEventsResponse) =>
                listCalendarEventsResponse.endeavors
                    .map(
                      (e) => Endeavor(
                        id: e.id,
                        title: e.title,
                        parentEndeavorId: e.parentEndeavorId,
                        subEndeavorReferences: e.subEndeavorReferences
                            .map(
                              (er) => EndeavorReference(
                                title: er.title,
                                id: er.id,
                              ),
                            )
                            .toList(),
                        taskReferences: e.task
                            .map(
                              (t) => TaskReference(
                                id: "fakeTaskId",
                                title: t.title,
                                endeavorId: t.endeavorReference.id,
                              ),
                            )
                            .toList(),
                        color: null, // TODO: add color
                      ),
                    )
                    .toList());

  void createPrimaryEndeavor(String endeavorTitle) {
    client.createEndeavor(
      CreateEndeavorRequest(
        userId: _userId,
        endeavorTitle: endeavorTitle,
      ),
    );
  }
}
