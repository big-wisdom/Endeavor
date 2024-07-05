import 'dart:ui';

import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class EndeavorDataService {
  EndeavorDataService() {}

  Stream<QueryState<List<Endeavor>>> get primaryEndeavorsStream =>
      GRPCDataService.instance.endeavors.primary.stream;

  void createPrimaryEndeavor(String endeavorTitle) async {
    GRPCDataService.instance.endeavors.primary.create(endeavorTitle);
  }

  void reorderEndeavorTasks(String endeavorId, List<String> taskIds) async {
    // ServerEndeavorDataServiceExtension.reorderEndeavorTasks(
    //     endeavorId, taskIds);
  }

  void reorderSubEndeavors(
      String endeavorId, List<String> subEndeavorIds) async {
    // ServerEndeavorDataServiceExtension.reorderSubEndeavors(
    //     endeavorId, subEndeavorIds);
  }

  void reorderPrimaryEndeavors(List<int> primaryEndeavorIds) async {
    // ServerEndeavorDataServiceExtension.reorderPrimaryEndeavors(
    //     primaryEndeavorIds);
  }

  void updateEndeavor(Endeavor endeavor) async {}

  planEndeavor(Endeavor endeavor) async {}

  void addSubEndeavor({
    required int parentEndeavorId,
    required String endeavorTitle,
  }) {
    // ServerEndeavorDataServiceExtension.addSubEndeavor(
    //     parentEndeavorId: parentEndeavorId, endeavorTitle: endeavorTitle);
  }

  Future<bool> deletePrimaryEndeavor(Endeavor endeavor) async {
    return Future.value(false);
  }

  void deleteSubEndeavor(EndeavorReference endeavorReference) {}

  void updateEndeavorColor({
    required String endeavorId,
    required Color color,
  }) {}
}
