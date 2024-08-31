import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ScheduleScreenCubit extends FormBloc<String, String> {
  final TextFieldBloc title;

  ScheduleScreenCubit({required Schedule schedule})
      : title = TextFieldBloc(name: "Title", initialValue: schedule.title) {
    addFieldBlocs(fieldBlocs: [
      title,
    ]);
    title.addValidators([_titleValidator()]);
  }

  Validator<String> _titleValidator() {
    return (String? title) {
      if (title == null || title.isEmpty) {
        return "You gotta name it!";
      }
      return null;
    };
  }

  @override
  FutureOr<void> onSubmitting() {
    print("Submitting changes to schedule");
  }
}
