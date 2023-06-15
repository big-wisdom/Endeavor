import 'package:formz/formz.dart';

enum MinnimumSchedulingDurationError { longerThanDuration, noDuration }

class MinnimumSchedulingDuration
    extends FormzInput<Duration?, MinnimumSchedulingDurationError> {
  const MinnimumSchedulingDuration.pure(this.duration) : super.pure(null);

  const MinnimumSchedulingDuration.dirty(
      {required Duration value, required this.duration})
      : super.dirty(value);

  final Duration? duration;

  @override
  MinnimumSchedulingDurationError? validator(Duration? value) {
    if (duration != null && value != null && duration!.compareTo(value) > 0) {
      return MinnimumSchedulingDurationError.longerThanDuration;
    } else if (duration == null && value != null) {
      return MinnimumSchedulingDurationError.noDuration;
    }

    return null;
  }
}

extension ErrorText on MinnimumSchedulingDurationError {
  String text() {
    switch (this) {
      case MinnimumSchedulingDurationError.longerThanDuration:
        return "Minnimum duration must be less than total duration";
      case MinnimumSchedulingDurationError.noDuration:
        return "There cannot be a minnimum scheduling duration with no duration at all";
    }
  }
}
