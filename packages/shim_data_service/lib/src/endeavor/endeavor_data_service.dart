import 'dart:ui';

import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';

class EndeavorDataService {
  static Stream<List<ServerEndeavor>> get serverEndeavorsStream =>
      ServerEndeavorDataServiceExtension.serverEndeavorsStream;

  static void createPrimaryEndeavor(String endeavorTitle) async {
    ServerEndeavorDataServiceExtension.createPrimaryEndeavor(endeavorTitle);
  }

  static void reorderEndeavorTasks(
      String endeavorId, List<String> taskIds) async {
    ServerEndeavorDataServiceExtension.reorderEndeavorTasks(
        endeavorId, taskIds);
  }

  static void reorderSubEndeavors(
      String endeavorId, List<String> subEndeavorIds) async {
    ServerEndeavorDataServiceExtension.reorderSubEndeavors(
        endeavorId, subEndeavorIds);
  }

  static void reorderPrimaryEndeavors(List<String> primaryEndeavorIds) async {
    ServerEndeavorDataServiceExtension.reorderPrimaryEndeavors(
        primaryEndeavorIds);
  }

  static void updateEndeavor(Endeavor endeavor) async {
    ServerEndeavorDataServiceExtension.updateEndeavor(endeavor);
  }

  static planEndeavor(Endeavor endeavor) async {
    ServerEndeavorDataServiceExtension.planEndeavor(endeavor);
  }

  static void addSubEndeavor({
    required String parentEndeavorId,
    required String endeavorTitle,
  }) {
    ServerEndeavorDataServiceExtension.addSubEndeavor(
        parentEndeavorId: parentEndeavorId, endeavorTitle: endeavorTitle);
  }

  static Future<bool> deletePrimaryEndeavor(Endeavor endeavor) async {
    return await ServerEndeavorDataServiceExtension.deletePrimaryEndeavor(
        endeavor);
  }

  static void deleteSubEndeavor(EndeavorReference endeavorReference) {
    ServerEndeavorDataServiceExtension.deleteSubEndeavor(endeavorReference);
  }

  static void updateEndeavorColor({
    required String endeavorId,
    required Color color,
  }) {
    ServerEndeavorDataServiceExtension.updateEndeavorColor(
        endeavorId: endeavorId, color: color);
  }
}
