import 'package:data_repository/data_repository.dart';
import 'package:endeavor/widgets/repeating_event_picker/cubit/repeating_event_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepeatingEventPicker extends StatelessWidget {
  const RepeatingEventPicker({
    required this.initialRepeatingEvent,
    required this.onChanged,
    super.key,
  });

  final void Function(RepeatingEvent repeatingEvent) onChanged;
  final RepeatingEvent? initialRepeatingEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepeatingEventPickerCubit(
        initialRepeatingEvent: initialRepeatingEvent,
        onChanged: onChanged,
      ),
      child: _RepeatingEventPickerWidget(),
    );
  }
}

class _RepeatingEventPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Start Date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Start Date:"),
            TextButton(
              onPressed: () async {
                DateTime? selection = await _selectDate(context, startDate);
                if (selection != null) {
                  setState(() {
                    startDate = selection;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(getRepeatingEvent());
                  }
                }
              },
              child: Text(startDate.toString()),
            ),
          ],
        ),
        // End Date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("End Date:"),
            TextButton(
              onPressed: () async {
                DateTime? selection = await _selectDate(context, endDate);
                if (selection != null) {
                  setState(() {
                    endDate = selection;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(getRepeatingEvent());
                  }
                }
              },
              child: Text(endDate.toString()),
            ),
          ],
        ),
        // Days of Week
        const Text("Days of the Week"),
        ToggleButtons(
          isSelected: daysOfWeek,
          children: dayOfWeekWidgets,
          onPressed: (index) {
            setState(() {
              daysOfWeek[index] = !daysOfWeek[index];
            });
            if (widget.onChanged != null) {
              widget.onChanged!(getRepeatingEvent());
            }
          },
        ),
        // Start Time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Start Time:"),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await _selectTime(context, startTime);
                if (selection != null) {
                  setState(() {
                    startTime = selection;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(getRepeatingEvent());
                  }
                }
              },
              child: Text(startTime.toString()),
            ),
          ],
        ),
        // End Time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("End Time:"),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await _selectTime(context, endTime);
                if (selection != null) {
                  setState(() {
                    endTime = selection;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(getRepeatingEvent());
                  }
                }
              },
              child: Text(endTime.toString()),
            ),
          ],
        )
      ],
    );
  }
}
