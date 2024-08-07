import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/calendar_event/calendar_event_data_service.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class EndeavorsDataService {
  Mutation<bool, CreateEndeavorRequest> _createMutation;
  Mutation<bool, DeleteEndeavorRequest> _deleteMutation;
  Query<List<Endeavor>> _query;
  static const String endeavorsKey = "endeavors";

  EndeavorsDataService(EndeavorClient client, String userId)
      : _query = Query(
          key: endeavorsKey,
          queryFn: () {
            return client
                .listEndeavors(ListEndeavorsRequest(userId: userId))
                .then(
                  (res) => res.endeavors
                      .map(
                        (e) => Endeavor(
                          id: e.id,
                          title: e.title,
                          subEndeavorReferences: e.subEndeavorReferences
                              .map(
                                (er) => EndeavorReference(
                                  title: er.title,
                                  id: er.id,
                                ),
                              )
                              .toList(),
                          taskReferences: e.task
                              .map((t) => TaskReference(
                                  id: t.id, endeavorId: e.id, title: t.title))
                              .toList(),
                        ),
                      )
                      .toList(),
                );
          },
        ),
        _createMutation = Mutation(
          refetchQueries: [endeavorsKey],
          queryFn: (req) => client
              .createEndeavor(
                CreateEndeavorRequest(
                  userId: userId,
                  endeavorTitle: req.endeavorTitle,
                  parentEndeavorId: req.parentEndeavorId,
                  color: req.color,
                ),
              )
              .then((p0) => true),
        ),
        _deleteMutation = Mutation(
          refetchQueries: [
            endeavorsKey,
            CalendarEventDataService.eventsQueryId,
          ],
          queryFn: (req) => client.deleteEndeavor(req).then((p0) => true),
        );

  Stream<QueryState<List<Endeavor>>> get primary =>
      _query.stream.map((qs) => qs.copyWith(
            data: qs.data
                ?.where(
                  (e) => e.parentEndeavorId == null || e.parentEndeavorId == 0,
                )
                .toList(),
          ));

  Stream<QueryState<TreeOfLife>> get treeOfLife => _query.stream.map(
        (qs) => QueryState(
          timeCreated: DateTime.now(),
          data: TreeOfLife.fromEndeavorsList(qs.data ?? []),
          status: qs.status,
          error: qs.error,
        ),
      );

  void create({required String endeavorTitle, required int? parentEndeavorId}) {
    _createMutation.mutate(
      CreateEndeavorRequest(
        endeavorTitle: endeavorTitle,
        parentEndeavorId: parentEndeavorId,
      ),
    );
  }

  Future<void> delete(int id) async {
    await _deleteMutation.mutate(DeleteEndeavorRequest(endeavorId: id));
  }
}
