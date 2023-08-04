import 'package:formz/formz.dart';

enum DivisibilityError {
  noDuration,
  durationTooShort,
}

class DivisibilityBox extends FormzInput<bool?, DivisibilityError> {
  const DivisibilityBox.pure(this.duration) : super.pure(null);

  const DivisibilityBox.dirty({required bool? value, required this.duration})
      : super.dirty(value);

  final Duration? duration;

  DivisibilityBox copyWith({
    Duration? newDuration,
  }) {
    return DivisibilityBox.dirty(
      value: value,
      duration: newDuration,
    );
  }

  @override
  DivisibilityError? validator(bool? value) {
    if (duration == null && value != null) {
      return DivisibilityError.noDuration;
    } else if (duration != null &&
        value != null &&
        value &&
        duration! < const Duration(minutes: 10)) {
      return DivisibilityError.durationTooShort;
    }
    return null;
  }
}

extension ErrorText on DivisibilityError {
  String text() {
    switch (this) {
      case DivisibilityError.noDuration:
        return "There must first be a duration for the duration to be divisible";
      case DivisibilityError.durationTooShort:
        return "Duration must be at least 10 minutes to be divisible";
    }
  }
}
