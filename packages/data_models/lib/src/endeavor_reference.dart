import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

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
  final int id;

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

Validator<EndeavorReference?> endeavorReferenceValidator() {
  return (EndeavorReference? er) {
    if (er == null) {
      return "Endeavor must be selected";
    }
    return null;
  };
}
