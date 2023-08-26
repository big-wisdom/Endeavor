import 'package:data_models/data_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/time_picker_row_cubit.dart';

enum TimePickerRowType { start, end }

class TimePickerRow extends StatelessWidget {
  const TimePickerRow._({
    required this.onTimeSelected,
    this.eventStartTimeInput,
    this.eventEndTimeInput,
    this.repeatingEventStartTimeInput,
    this.repeatingEventEndTimeInput,
  });

  final EventStartTimeInput? eventStartTimeInput;
  final EventEndTimeInput? eventEndTimeInput;
  final RepeatingEventStartTimeInput? repeatingEventStartTimeInput;
  final RepeatingEventEndTimeInput? repeatingEventEndTimeInput;
  final Function(TimeOfDay) onTimeSelected;

  factory TimePickerRow.eventStartTime({
    required EventStartTimeInput startTimeInput,
    required Function(TimeOfDay) onTimeSelected,
  }) {
    return TimePickerRow._(
      eventStartTimeInput: startTimeInput,
      eventEndTimeInput: null,
      onTimeSelected: onTimeSelected,
    );
  }

  factory TimePickerRow.eventEndTime({
    required EventEndTimeInput endTimeInput,
    required Function(TimeOfDay) onTimeSelected,
  }) {
    return TimePickerRow._(
      eventStartTimeInput: null,
      eventEndTimeInput: endTimeInput,
      onTimeSelected: onTimeSelected,
    );
  }

  factory TimePickerRow.repeatingEventStartTime({
    required RepeatingEventStartTimeInput repeatingEventStartTimeInput,
    required Function(TimeOfDay) onTimeSelected,
  }) {
    return TimePickerRow._(
      repeatingEventStartTimeInput: repeatingEventStartTimeInput,
      onTimeSelected: onTimeSelected,
    );
  }

  factory TimePickerRow.repeatingEventEndTime({
    required RepeatingEventEndTimeInput repeatingEventEndTimeInput,
    required Function(TimeOfDay) onTimeSelected,
  }) {
    return TimePickerRow._(
      repeatingEventEndTimeInput: repeatingEventEndTimeInput,
      onTimeSelected: onTimeSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = (() {
      if (eventStartTimeInput != null) {
        return TimePickerRowCubit.eventStartTime(
          onTimeSelected,
          eventStartTimeInput!,
        );
      } else if (eventEndTimeInput != null) {
        return TimePickerRowCubit.eventEndTime(
          onTimeSelected,
          eventEndTimeInput!,
        );
      } else if (repeatingEventStartTimeInput != null) {
        return TimePickerRowCubit.repeatingEventStartTime(
          onTimeSelected,
          repeatingEventStartTimeInput!,
        );
      } else {
        return TimePickerRowCubit.repeatingEventEndTime(
          onTimeSelected,
          repeatingEventEndTimeInput!,
        );
      }
    })();
    return BlocProvider(
      create: (context) => cubit,
      child: _TimePickerRowWidget(),
    );
  }
}

class _TimePickerRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimePickerRowCubit, TimePickerRowState>(
      buildWhen: (previous, current) => previous.time != current.time,
      builder: (context, state) {
        final cubit = context.read<TimePickerRowCubit>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state is EventStartTimePickerRowState ||
                        state is RepeatingEventStartTimePickerRowState
                    ? "Start Time: "
                    : "End Time:"),
                TextButton(
                  onPressed: () async {
                    TimeOfDay? selection = await showTimePicker(
                      context: context,
                      initialTime: state.time ?? TimeOfDay.now(),
                      builder: (context, child) {
                        if (child != null) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: false),
                            child: child,
                          );
                        } else {
                          return const Text("loading...");
                        }
                      },
                    );
                    if (selection != null) {
                      cubit.timeSelected(selection);
                    }
                  },
                  child: Text(state.time?.toString() ?? "Select Time"),
                ),
              ],
            ),
            if (state.errorText != null)
              Text(
                state.errorText!,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        );
      },
    );
  }
}
