import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';

class RepeatingEndeavorBlockDataService {
  void createRepeatingEndeavorBlock(
    UnidentifiedRepeatingEndeavorBlock repeatingEndeavorBlock,
  ) {
    AbstractRepeatingEndeavorBlockDataServiceExtension
        .createRepeatingEndeavorBlock(repeatingEndeavorBlock);
  }

  void editThisAndFollowingEndeavorBlocks({
    required String endeavorBlockId,
    required String repeatingEndeavorBlockId,
    required UnidentifiedEndeavorBlock unidentifiedEndeavorBlock,
  }) async {
    AbstractRepeatingEndeavorBlockDataServiceExtension
        .editThisAndFollowingEndeavorBlocks(
            endeavorBlockId: endeavorBlockId,
            repeatingEndeavorBlockId: repeatingEndeavorBlockId,
            unidentifiedEndeavorBlock: unidentifiedEndeavorBlock);
  }

  void deleteThisAndFollowing({
    required String endeavorBlockId,
    required String repeatingEndeavorBlockId,
  }) async {
    AbstractRepeatingEndeavorBlockDataServiceExtension.deleteThisAndFollowing(
        endeavorBlockId: endeavorBlockId,
        repeatingEndeavorBlockId: repeatingEndeavorBlockId);
  }
}
