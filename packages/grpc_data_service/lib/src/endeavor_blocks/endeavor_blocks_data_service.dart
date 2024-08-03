import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/calendar_event/calendar_event_data_service.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';
import 'package:grpc_data_service/src/generated_protos/google/protobuf/timestamp.pb.dart';
import '../generated_protos/common_models/event.pb.dart' as EventProto;
import '../generated_protos/common_models/endeavorReference.pb.dart' as ER;

class EndeavorBlocksDataService {
  EndeavorClient client;
  String _userId;

  // EndeavorBlock Mutations
  Mutation<bool, CreateEventRequest> _createMutation;

  EndeavorBlocksDataService(this.client, String userId)
      : _userId = userId,
        _createMutation = Mutation(
          refetchQueries: [CalendarEventDataService.eventsQueryId],
          queryFn: (createEventRequest) =>
              client.createEvent(createEventRequest).then((v) => true),
        );

  void CreateEndeavorBlock(UnidentifiedEndeavorBlock endeavorBlock) {
    _createMutation.mutate(
      CreateEventRequest(
        event: EventProto.Event(
          userId: _userId,
          endeavorReference: ER.EndeavorReference(
            id: endeavorBlock.endeavorReference.id,
            title: endeavorBlock.endeavorReference.title,
          ),
          isEndeavorBlock: true,
          title: endeavorBlock.endeavorReference.title,
          startTime: Timestamp.fromDateTime(endeavorBlock.event.start),
          endTime: Timestamp.fromDateTime(endeavorBlock.event.end),
          hoursOffset: DateTime.now().timeZoneOffset.inHours,
        ),
      ),
    );
  }
}
