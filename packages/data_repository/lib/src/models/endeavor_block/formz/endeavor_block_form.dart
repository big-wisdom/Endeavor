import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class EndeavorBlockForm extends Equatable with FormzMixin {
  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}
