import 'package:endeavor/Models/event/event.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class OneTimeEventPicker extends StatefulWidget {
  const OneTimeEventPicker({required this.event, this.onChanged, super.key});

  final Event event;
  final Function(String, dynamic)? onChanged;

  @override
  State<OneTimeEventPicker> createState() => _OneTimeEventPickerState();
}

class _OneTimeEventPickerState extends State<OneTimeEventPicker> {
  late Event event;

  @override
  void initState() {
    event = widget.event;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // date picker
        SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.single,
          initialSelectedDate: event.start,
          onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
            DateTime selection =
                (dateRangePickerSelectionChangedArgs.value as DateTime);
            DateTime newStart = event.start!.copyWith(
              day: selection.day,
              year: selection.year,
              month: selection.month,
            );
            DateTime newEnd = event.end!.copyWith(
              day: selection.day,
              year: selection.year,
              month: selection.month,
            );

            setState(() {
              event.start = newStart;
              event.end = newEnd;
            });
            if (widget.onChanged != null) {
              widget.onChanged!('start', newStart);
              widget.onChanged!('end', newEnd);
            }
          },
          monthViewSettings:
              const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
        ),
        // Start time picker
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Start Time: "),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await _selectTime(
                    context,
                    event.start == null
                        ? TimeOfDay.now()
                        : TimeOfDay.fromDateTime(event.start!));
                if (selection != null) {
                  DateTime newStart = event.start!
                      .copyWith(hour: selection.hour, minute: selection.minute);

                  setState(
                    () {
                      event.start = newStart;
                    },
                  );
                  if (widget.onChanged != null) {
                    widget.onChanged!('start', newStart);
                  }
                }
              },
              child: Text(event.start?.toString() ?? "Select Time"),
            ),
          ],
        ),
        // End time picker
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("End Time: "),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await _selectTime(
                    context,
                    event.end == null
                        ? TimeOfDay.fromDateTime(
                            DateTime.now().add(const Duration(hours: 1)))
                        : TimeOfDay.fromDateTime(event.end!));
                if (selection != null) {
                  DateTime newEnd = event.end!
                      .copyWith(hour: selection.hour, minute: selection.minute);
                  setState(() {
                    event.end = newEnd;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!('end', newEnd);
                  }
                }
              },
              child: Text(event.end?.toString() ?? "Select Time"),
            ),
          ],
        ),
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
}
