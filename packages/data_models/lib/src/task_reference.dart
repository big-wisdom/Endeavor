import 'package:equatable/equatable.dart';

class TaskReference extends Equatable {
  const TaskReference({
    required this.id,
    this.endeavorId,
    required this.title,
  });

  final String id;
  final String? endeavorId;
  final String title;

  @override
  List<Object?> get props => [id, title];
}
