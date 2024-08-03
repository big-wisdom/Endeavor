import 'package:equatable/equatable.dart';

class TaskReference extends Equatable {
  const TaskReference({
    required this.id,
    required this.endeavorId,
    required this.title,
  });

  final int id;
  final int? endeavorId;
  final String title;

  @override
  List<Object?> get props => [id, title];
}
