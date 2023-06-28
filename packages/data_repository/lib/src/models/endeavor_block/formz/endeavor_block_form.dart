import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class EndeavorBlockForm extends Equatable with FormzMixin {
  const EndeavorBlockForm({
    required this.endeavor,
    required this.type,
    required this.event,
  });

  final EndeavorPickerRowInput endeavor;
  final EndeavorBlockTypeInput type;
  final EventInput event;

  @override
  List<FormzInput> get inputs => [
        endeavor,
        type,
        event,
      ];
}
