import 'package:formz/formz.dart';

class EndeavorError {}

class EndeavorId extends FormzInput<String?, EndeavorError> {
  const EndeavorId.pure({required String value, this.endeavorTitle})
      : super.pure(value);

  const EndeavorId.dirty({required String value, this.endeavorTitle})
      : super.dirty(value);

  final String? endeavorTitle;

  @override
  EndeavorError? validator(String? value) {
    return null;
  }
}
