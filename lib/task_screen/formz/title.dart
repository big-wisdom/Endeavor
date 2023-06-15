import 'package:formz/formz.dart';

enum TitleError {
  empty,
}

class Title extends FormzInput<String, TitleError> {
  const Title.pure() : super.pure('');

  Title.dirty(super.value) : super.dirty();

  @override
  TitleError? validator(String value) {
    return value.isEmpty ? TitleError.empty : null;
  }
}

extension ErrorText on TitleError {
  String text() {
    switch (this) {
      case TitleError.empty:
        return "Title must not be empty";
    }
  }
}
