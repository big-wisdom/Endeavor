import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class EndeavorsDataService {
  Mutation<bool, CreateEndeavorRequest> _mutation;
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
        _mutation = Mutation(
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
        (qs) => (qs as QueryState<TreeOfLife>).copyWith(
          data: TreeOfLife.fromEndeavorsList(qs.data ?? []),
        ),
      );

  void create(String endeavorTitle) {
    _mutation.mutate(CreateEndeavorRequest(endeavorTitle: endeavorTitle));
  }
}
