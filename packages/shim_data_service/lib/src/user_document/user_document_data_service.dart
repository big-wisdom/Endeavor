import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';

class UserDocumentDataService {
  static Stream<UserDocument?> get userDocstream =>
      UserDocumentDataServiceExtension.userDocStream;
}
