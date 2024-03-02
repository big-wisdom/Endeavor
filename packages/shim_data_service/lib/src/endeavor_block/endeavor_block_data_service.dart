import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';
import './repeating_endeavor_block/repeating_endeavor_block_data_service.dart';

class EndeavorBlockDataService {
  static RepeatingEndeavorBlockDataService repeating =
      RepeatingEndeavorBlockDataService();

  static Stream<List<ServerEndeavorBlock>> get serverEndeavorBlockStream =>
      ServerEndeavorBlockDataServiceExtension.serverEndeavorBlockStream;

  static void createEndeavorBlock(UnidentifiedEndeavorBlock endeavorBlock) {
    ServerEndeavorBlockDataServiceExtension.createEndeavorBlock(endeavorBlock);
  }

  static void deleteEndeavorBlock(String id) async {
    ServerEndeavorBlockDataServiceExtension.deleteEndeavorBlock(id);
  }

  static void updateEndeavorBlock(EndeavorBlock eb) {
    ServerEndeavorBlockDataServiceExtension.updateEndeavorBlock(eb);
  }
}
