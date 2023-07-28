import 'package:data_models/data_models.dart';
import 'package:flutter/material.dart';

class ServerEndeavor {
  const ServerEndeavor({
    required this.id,
    required this.title,
    required this.subEndeavorIds,
    required this.taskIds,
    this.parentEndeavorId,
    this.color,
  });

  factory ServerEndeavor.fromEndeavor(Endeavor endeavor) {
    return ServerEndeavor(
      id: endeavor.id,
      title: endeavor.title,
      subEndeavorIds: endeavor.subEndeavorReferences.map((e) => e.id).toList(),
      taskIds: endeavor.taskReferences.map((e) => e.id).toList(),
      parentEndeavorId: endeavor.parentEndeavorId,
      color: endeavor.color,
    );
  }

  final String id;
  final String title;
  final List<String> subEndeavorIds;
  final List<String> taskIds;
  final String? parentEndeavorId;
  final Color? color;
}
