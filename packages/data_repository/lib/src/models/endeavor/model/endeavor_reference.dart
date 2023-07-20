import 'package:equatable/equatable.dart';

class EndeavorReference extends Equatable {
  const EndeavorReference({
    required this.title,
    required this.id,
  });

  final String title;
  final String id;

  EndeavorReference copyWithNewTitle({
    required String newEndeavorTitle,
  }) {
    return EndeavorReference(
      title: newEndeavorTitle,
      id: id,
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
      ];
}
