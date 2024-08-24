import 'package:equatable/equatable.dart';

class Schedule extends Equatable {
  const Schedule({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [];
}
