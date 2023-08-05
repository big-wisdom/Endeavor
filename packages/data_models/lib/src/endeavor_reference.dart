import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

class EndeavorReference extends Equatable {
  const EndeavorReference({
    required this.title,
    required this.id,
  });

  factory EndeavorReference.fromEndeavor(Endeavor endeavor) {
    return EndeavorReference(
      title: endeavor.title,
      id: endeavor.id,
    );
  }

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
