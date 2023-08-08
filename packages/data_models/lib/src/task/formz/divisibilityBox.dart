import 'package:formz/formz.dart';

enum DivisibilityError {
  noDuration,
  durationTooShort,
  mustSpecifyMinnimumDuration,
}

class DivisibilityBox extends FormzInput<bool?, DivisibilityError> {
  const DivisibilityBox.pure(this.duration, this.minnimumSchedulingDuration)
      : super.pure(null);

  factory DivisibilityBox.clear() {
    return DivisibilityBox.pure(null, null);
  }

  const DivisibilityBox.dirty({
    required bool? value,
    required this.duration,
    required this.minnimumSchedulingDuration,
  }) : super.dirty(value);

  final Duration? duration;
  final Duration? minnimumSchedulingDuration;

  DivisibilityBox copyWith({
    Duration? newDuration,
    Duration? newMinnimumSchedulingDuration,
  }) {
    return DivisibilityBox.dirty(
      value: value,
      duration: newDuration ?? duration,
      minnimumSchedulingDuration:
          newMinnimumSchedulingDuration ?? minnimumSchedulingDuration,
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
    } else if (value != null && value && minnimumSchedulingDuration == null) {
      return DivisibilityError.mustSpecifyMinnimumDuration;
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
      case DivisibilityError.mustSpecifyMinnimumDuration:
        return "Must specify minnimum scheduling duration if divisble";
    }
  }
}
