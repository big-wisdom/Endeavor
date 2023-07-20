import 'dart:ui';

import 'package:equatable/equatable.dart';

class EndeavorDatabaseDocument extends Equatable {
  const EndeavorDatabaseDocument({
    required this.id,
    required this.title,
    this.color,
  });

  final String id;
  final String title;
  final Color? color;

  @override
  List<Object?> get props => [];
}
