import 'dart:ui';

import 'package:equatable/equatable.dart';

class WeekViewEvent extends Equatable {
  const WeekViewEvent({
    required this.title,
    required this.backgroundColor,
    required this.start,
    required this.end,
    required this.isEndeavorBlock,
    required this.taskId,
  });

  /// The event title.
  final String title;

  /// The event start date & time.
  final DateTime start;

  /// The event end date & time.
  final DateTime end;

  /// The event widget background color.
  final Color? backgroundColor;

  /// The original object that this was created from
  final bool isEndeavorBlock;
  final int? taskId;

  @override
  List<Object?> get props =>
      [title, start, end, backgroundColor, isEndeavorBlock];
}
