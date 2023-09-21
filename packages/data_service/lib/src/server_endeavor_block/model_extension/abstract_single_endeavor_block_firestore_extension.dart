import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';

extension AbstractSingleEndeavorBlockFirestoreExtension
    on AbstractSingleEndeavorBlock {
  Map<String, dynamic> toDocData() {
    return {
      ServerEndeavorBlockDataFields.endeavorId.string(): endeavorReference.id,
      ServerEndeavorBlockDataFields.repeatingEndeavorBlockId.string():
          repeatingEndeavorBlockId,
      ServerEndeavorBlockDataFields.serverEvent.string(): event.toDocData(),
    };
  }
}
