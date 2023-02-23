import 'package:endeavor/Models/event/repeating_event.dart';
import 'package:flutter/material.dart';

class RepeatingEventPicker extends StatefulWidget {
  const RepeatingEventPicker(
      {required this.repeatingEvent, this.onChanged, super.key});

  final RepeatingEvent repeatingEvent;
  final Function(String, dynamic)? onChanged;

  @override
  State<RepeatingEventPicker> createState() => _RepeatingEventPickerState();
}

class _RepeatingEventPickerState extends State<RepeatingEventPicker> {
  late DateTime startDate;
  late DateTime endDate;
  late TimeOfDay startTime;
  late TimeOfDay endTime;
  late List<bool> daysOfWeek;

  List<Text> dayOfWeekWidgets = const [
    Text('M'),
    Text('T'),
    Text('W'),
    Text('Th'),
    Text('F'),
    Text('S'),
    Text('S'),
  ];

  @override
  void initState() {
    startDate = widget.repeatingEvent.startDate!;
    endDate = widget.repeatingEvent.endDate!;
    startTime = widget.repeatingEvent.startTime!;
    endTime = widget.repeatingEvent.endTime!;
    daysOfWeek = widget.repeatingEvent.daysOfWeek!;

    super.initState();
  }

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
                  widget.repeatingEvent.startDate = selection;
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
                  widget.repeatingEvent.endDate = selection;
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
            widget.repeatingEvent.daysOfWeek![index] = daysOfWeek[index];
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
                  widget.repeatingEvent.startTime = selection;
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
                  widget.repeatingEvent.endTime = selection;
                }
              },
              child: Text(endTime.toString()),
            ),
          ],
        )
      ],
    );
  }

  Future<TimeOfDay?> _selectTime(
      BuildContext context, TimeOfDay selectedTime) async {
    final TimeOfDay? pickedS = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        if (child != null) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        } else {
          return const Text("loading...");
        }
      },
    );

    if (pickedS != null && pickedS != selectedTime) {
      return pickedS;
    } else {
      return null;
    }
  }

  Future<DateTime?> _selectDate(
      BuildContext context, DateTime selectedDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate.copyWith(day: 1),
      lastDate:
          selectedDate.copyWith(month: selectedDate.month + 1, day: 1).subtract(
                const Duration(days: 1),
              ),
    );

    return pickedDate;
  }
}
