import 'package:equatable/equatable.dart';

class Schedule extends Equatable {
  const Schedule({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  List<Object?> get props => [];
}
