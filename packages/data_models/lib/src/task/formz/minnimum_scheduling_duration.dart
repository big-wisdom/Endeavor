import 'package:formz/formz.dart';

enum MinnimumSchedulingDurationError {
  longerThanDuration,
  noDuration,
  divisibilityUnspecified,
  notDivisible
}

class MinnimumSchedulingDuration
    extends FormzInput<Duration?, MinnimumSchedulingDurationError> {
  const MinnimumSchedulingDuration.pure({
    required this.duration,
    required this.divisible,
  }) : super.pure(null);

  const MinnimumSchedulingDuration.dirty({
    required Duration? value,
    required this.duration,
    required this.divisible,
  }) : super.dirty(value);

  final Duration? duration;
  final bool? divisible;

  MinnimumSchedulingDuration copyWith({
    Duration? newMinnimumSchedulingDuration,
    Duration? newDuration,
    bool? newDivisibility,
  }) {
    return MinnimumSchedulingDuration.dirty(
      value: newMinnimumSchedulingDuration ?? this.value,
      duration: newDuration ?? duration,
      divisible: newDivisibility ?? divisible,
    );
  }

  @override
  MinnimumSchedulingDurationError? validator(Duration? value) {
    if (duration != null && value != null && duration!.compareTo(value) < 0) {
      return MinnimumSchedulingDurationError.longerThanDuration;
    } else if (duration == null && value != null) {
      return MinnimumSchedulingDurationError.noDuration;
    }

    if (divisible == null && value != null) {
      return MinnimumSchedulingDurationError.divisibilityUnspecified;
    }

    if (divisible != null && !divisible!) {
      return MinnimumSchedulingDurationError.notDivisible;
    }

    return null;
  }
}

extension MinnimumSchedulingDurationErrorText
    on MinnimumSchedulingDurationError {
  String text() {
    switch (this) {
      case MinnimumSchedulingDurationError.longerThanDuration:
        return "Minnimum duration must be less than total duration";
      case MinnimumSchedulingDurationError.noDuration:
        return "There cannot be a minnimum scheduling duration with no duration at all";
      case MinnimumSchedulingDurationError.divisibilityUnspecified:
        throw Exception("The UI should not allow this to happen");
      case MinnimumSchedulingDurationError.notDivisible:
        throw Exception(
          "The UI should not allow a minnimum scheduling duration when it's not divisible",
        );
    }
  }
}
