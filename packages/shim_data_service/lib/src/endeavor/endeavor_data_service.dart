import 'dart:ui';

import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';

class EndeavorDataService {
  Stream<List<ServerEndeavor>> get serverEndeavorsStream =>
      ServerEndeavorDataServiceExtension.serverEndeavorsStream;

  void createPrimaryEndeavor(String endeavorTitle) async {
    ServerEndeavorDataServiceExtension.createPrimaryEndeavor(endeavorTitle);
  }

  void reorderEndeavorTasks(String endeavorId, List<String> taskIds) async {
    ServerEndeavorDataServiceExtension.reorderEndeavorTasks(
        endeavorId, taskIds);
  }

  void reorderSubEndeavors(
      String endeavorId, List<String> subEndeavorIds) async {
    ServerEndeavorDataServiceExtension.reorderSubEndeavors(
        endeavorId, subEndeavorIds);
  }

  void reorderPrimaryEndeavors(List<String> primaryEndeavorIds) async {
    ServerEndeavorDataServiceExtension.reorderPrimaryEndeavors(
        primaryEndeavorIds);
  }

  void updateEndeavor(Endeavor endeavor) async {
    ServerEndeavorDataServiceExtension.updateEndeavor(endeavor);
  }

  planEndeavor(Endeavor endeavor) async {
    ServerEndeavorDataServiceExtension.planEndeavor(endeavor);
  }

  void addSubEndeavor({
    required String parentEndeavorId,
    required String endeavorTitle,
  }) {
    ServerEndeavorDataServiceExtension.addSubEndeavor(
        parentEndeavorId: parentEndeavorId, endeavorTitle: endeavorTitle);
  }

  Future<bool> deletePrimaryEndeavor(Endeavor endeavor) async {
    return await ServerEndeavorDataServiceExtension.deletePrimaryEndeavor(
        endeavor);
  }

  void deleteSubEndeavor(EndeavorReference endeavorReference) {
    ServerEndeavorDataServiceExtension.deleteSubEndeavor(endeavorReference);
  }

  void updateEndeavorColor({
    required String endeavorId,
    required Color color,
  }) {
    ServerEndeavorDataServiceExtension.updateEndeavorColor(
        endeavorId: endeavorId, color: color);
  }
}
