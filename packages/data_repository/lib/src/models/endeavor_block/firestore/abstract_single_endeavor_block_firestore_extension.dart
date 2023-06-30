import 'package:data_repository/data_repository.dart';

extension AbstractSingleEndeavorBlockFirestoreExtension
    on AbstractSingleEndeavorBlock {
  Map<String, dynamic> toDocData() {
    return {
      'endeavorTitle': endeavorReference.endeavorTitle,
      'endeavorId': endeavorReference.endeavorId,
      'repeatingEndeavorBlockId': repeatingEndeavorBlockId,
      'start': event.start,
      'end': event.end,
    };
  }
}
