import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:grpc_data_service/grpc_data_service.dart';
import 'package:server_data_models/server_data_models.dart';
import './repeating_endeavor_block/repeating_endeavor_block_data_service.dart';

class EndeavorBlockDataService {
  RepeatingEndeavorBlockDataService repeating =
      RepeatingEndeavorBlockDataService();

  Stream<List<ServerEndeavorBlock>> get serverEndeavorBlockStream =>
      ServerEndeavorBlockDataServiceExtension.serverEndeavorBlockStream;

  void createEndeavorBlock(UnidentifiedEndeavorBlock endeavorBlock) {
    GRPCDataService.instance.endeavorBlocks.CreateEndeavorBlock(endeavorBlock);
  }

  void deleteEndeavorBlock(String id) async {
    ServerEndeavorBlockDataServiceExtension.deleteEndeavorBlock(id);
  }

  void updateEndeavorBlock(EndeavorBlock eb) {
    ServerEndeavorBlockDataServiceExtension.updateEndeavorBlock(eb);
  }
}
