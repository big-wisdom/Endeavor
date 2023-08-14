import 'package:data_models/data_models.dart';

extension AbstractSingleEndeavorBlockFirestoreExtension
    on AbstractSingleEndeavorBlock {
  Map<String, dynamic> toDocData() {
    return {
      'endeavorTitle': endeavorReference.title,
      'endeavorId': endeavorReference.id,
      'repeatingEndeavorBlockId': repeatingEndeavorBlockId,
      'start': event.start,
      'end': event.end,
    };
  }
}
