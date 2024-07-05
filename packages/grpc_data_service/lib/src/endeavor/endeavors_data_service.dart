import 'package:grpc_data_service/src/endeavor/primary_endeavors_data_wrapper.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class EndeavorsDataService {
  EndeavorClient _client;
  String _userId;

  EndeavorsDataService(EndeavorClient client, String userid)
      : _client = client,
        _userId = userid;

  // Primary Endeavors
  late PrimaryEndeavorsDataWrapper primary =
      PrimaryEndeavorsDataWrapper(_client, _userId);
}
