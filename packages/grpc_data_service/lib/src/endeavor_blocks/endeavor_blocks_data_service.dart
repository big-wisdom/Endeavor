import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';
import 'package:grpc_data_service/src/generated_protos/google/protobuf/timestamp.pb.dart';
import '../generated_protos/common_models/endeavor_block.pb.dart'
    as EndeavorBlockProto;
import '../generated_protos/common_models/event.pb.dart' as EventProto;

class EndeavorBlocksDataService {
  EndeavorClient client;
  String _userId;
  EndeavorBlocksDataService(this.client, String userId) : _userId = userId;

  void CreateEndeavorBlock(UnidentifiedEndeavorBlock endeavorBlock) {
    client.createEndeavorBlock(CreateEndeavorBlockRequest(
      userId: _userId,
      endeavorBlock: EndeavorBlockProto.EndeavorBlock(
        endeavorId: null, // TODO: add endeavorId
        event: EventProto.Event(
          userId: _userId,
          endeavorId: null, // TODO: add endeavorId
          title: endeavorBlock.endeavorReference.title,
          startTime: Timestamp.fromDateTime(endeavorBlock.event.start),
          endTime: Timestamp.fromDateTime(endeavorBlock.event.end),
        ),
      ),
    ));
  }
}
