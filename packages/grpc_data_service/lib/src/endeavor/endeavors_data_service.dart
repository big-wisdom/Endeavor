import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class EndeavorsDataService {
  EndeavorClient client;
  String _userId;
  EndeavorsDataService(this.client, String userId) : _userId = userId;

  void createPrimaryEndeavor(String endeavorTitle) {
    client.createEndeavor(
      CreateEndeavorRequest(
        userId: _userId,
        endeavorTitle: endeavorTitle,
      ),
    );
  }
}
