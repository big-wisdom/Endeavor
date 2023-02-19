import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateEndeavorBlock extends StatefulWidget {
  const CreateEndeavorBlock({required this.uid, super.key});

  final String uid;

  @override
  State<CreateEndeavorBlock> createState() => _CreateEndeavorBlockState();
}

class _CreateEndeavorBlockState extends State<CreateEndeavorBlock> {
  // form data items
  String? selectedEndeavorId;
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now(); // start now
  TimeOfDay endTime = TimeOfDay.fromDateTime(
      DateTime.now().add(const Duration(hours: 1))); // end an hour from now

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> endeavorsStream = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('endeavors')
        .snapshots();

    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Create Endeavor Block"),
              // Endeavor picker
              StreamBuilder(
                stream: endeavorsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<Map<String, dynamic>> endeavors =
                        snapshot.data!.docs.map((docSnap) {
                      var data = docSnap.data()! as Map<String, dynamic>;
                      data['id'] = docSnap.id;
                      return data;
                    }).toList();

                    String value = selectedEndeavorId ?? endeavors[0]['id'];

                    return DropdownButton(
                      value:
                          value, // What about the scenario when there are no endeavors
                      items: endeavors.map((item) {
                        return DropdownMenuItem<String>(
                          value: item['id'],
                          child: Text(
                            (item['text']),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedEndeavorId = newValue;
                          });
                        }
                      },
                    );
                  } else {
                    return const Text("Loading...");
                  }
                },
              ),
              // date picker
              SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.single,
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                  selectedDate = dateRangePickerSelectionChangedArgs.value;
                },
                monthViewSettings:
                    const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              ),
              // Start time picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Start Time: "),
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? selection =
                          await _selectTime(context, startTime);
                      if (selection != null) {
                        setState(() {
                          startTime = selection;
                        });
                      }
                    },
                    child: Text(startTime.toString()),
                  ),
                ],
              ),
              // End time picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("End Time: "),
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? selection =
                          await _selectTime(context, endTime);
                      if (selection != null) {
                        setState(() {
                          endTime = selection;
                        });
                      }
                    },
                    child: Text(endTime.toString()),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // make sure end is after beginning
                  if (timeOfDayToDouble(endTime) >
                          timeOfDayToDouble(startTime) &&
                      selectedEndeavorId != null) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.uid)
                        .collection('endeavorBlocks')
                        .add(
                      {
                        'endeavorId': selectedEndeavorId,
                        'start': selectedDate.copyWith(
                            hour: startTime.hour, minute: startTime.minute),
                        'end': selectedDate.copyWith(
                            hour: endTime.hour, minute: endTime.minute),
                      },
                    );
                  }
                },
                child: const Text("Add Block"),
              ),
            ],
          ),
        ),
      ),
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

  double timeOfDayToDouble(TimeOfDay time) => time.hour + time.minute / 60;
}
