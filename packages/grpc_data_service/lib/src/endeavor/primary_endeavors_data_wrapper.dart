import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class PrimaryEndeavorsDataWrapper {
  EndeavorClient _client;
  String _userId;
  static const _key = 'primaryEndeavors';

  PrimaryEndeavorsDataWrapper(EndeavorClient client, String userId)
      : _client = client,
        _userId = userId;

  late Query<List<Endeavor>> _query = Query(
    key: _key,
    queryFn: () {
      print("getting primary endeavors");
      return _client
          .getPrimaryEndeavors(GetPrimaryEndeavorsRequest(userId: _userId))
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
  );

  late Mutation<bool, CreateEndeavorRequest> _mutation = Mutation(
    queryFn: (req) => _client.createEndeavor(req).then((p0) => true),
    refetchQueries: [_key],
  );

  Stream<QueryState<List<Endeavor>>> get stream => _query.stream;
  void create(String endeavorTitle) {
    print("Running create");
    _mutation.mutate(
      CreateEndeavorRequest(
        userId: _userId,
        endeavorTitle: endeavorTitle,
      ),
    );
  }
}
