import 'package:endeavor/Models/event.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class OneTimeEventPicker extends StatefulWidget {
  const OneTimeEventPicker({required this.event, super.key});

  final Event event;

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
            setState(() {
              event.start = event.start!.copyWith(
                day: selection.day,
                year: selection.year,
                month: selection.month,
              );
              event.end = event.end!.copyWith(
                day: selection.day,
                year: selection.year,
                month: selection.month,
              );
            });
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
                  setState(() {
                    event.start = event.start!.copyWith(
                        hour: selection.hour, minute: selection.minute);
                  });
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
                  setState(() {
                    event.end = event.end!.copyWith(
                        hour: selection.hour, minute: selection.minute);
                  });
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
