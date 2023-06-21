import 'package:formz/formz.dart';

enum TaskTitleError {
  empty,
}

class TaskTitle extends FormzInput<String, TaskTitleError> {
  const TaskTitle.pure() : super.pure('');

  TaskTitle.dirty(super.value) : super.dirty();

  @override
  TaskTitleError? validator(String value) {
    return value.isEmpty ? TaskTitleError.empty : null;
  }
}

extension TaskTitleErrorText on TaskTitleError {
  String text() {
    switch (this) {
      case TaskTitleError.empty:
        return "Title must not be empty";
    }
  }
}
