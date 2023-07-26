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

  final String id;
  final String title;
  final List<String> subEndeavorIds;
  final List<String> taskIds;
  final String? parentEndeavorId;
  final Color? color;
  // TODO: this should have color but for some reason 'dart:ui' wont import
}
