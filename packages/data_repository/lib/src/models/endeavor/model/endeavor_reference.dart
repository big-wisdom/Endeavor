import 'package:equatable/equatable.dart';

class EndeavorReference extends Equatable {
  const EndeavorReference({
    required this.endeavorTitle,
    required this.endeavorId,
  });

  final String endeavorTitle;
  final String endeavorId;

  @override
  List<Object?> get props => [
        endeavorTitle,
        endeavorId,
      ];
}
