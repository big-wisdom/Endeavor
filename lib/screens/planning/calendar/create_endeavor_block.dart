import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/endeavor_block/one_time_endeavor_block.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:endeavor/widgets/endeavor_dropdown_button.dart';
import 'package:endeavor/widgets/one_time_event_picker.dart';
import 'package:flutter/material.dart';

import '../../../Models/event.dart';

class CreateEndeavorBlock extends StatefulWidget {
  const CreateEndeavorBlock(
      {this.endeavorBlock,
      required this.uid,
      required this.setCalendarView,
      super.key});

  final EndeavorBlock? endeavorBlock;
  final String uid;
  final Function(CalendarView, DateTime) setCalendarView;

  @override
  State<CreateEndeavorBlock> createState() => _CreateEndeavorBlockState();
}

class _CreateEndeavorBlockState extends State<CreateEndeavorBlock> {
  late EndeavorBlock endeavorBlock;

  @override
  void initState() {
    endeavorBlock = widget.endeavorBlock ??
        OneTimeEndeavorBlock(
            event: Event(
                start: DateTime.now(),
                end: DateTime.now().add(const Duration(hours: 1))));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.endeavorBlock == null ? "Create" : "Edit"} Endeavor Block",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Endeavor picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Endeavor:"),
                  EndeavorsDropdownButton(
                    uid: widget.uid,
                    onChanged: (value) {
                      setState(() {
                        endeavorBlock.endeavorId = value;
                      });
                    },
                  ),
                ],
              ),
              // Type picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Type:'),
                  DropdownButton(
                    value: endeavorBlock.type,
                    items: const [
                      DropdownMenuItem(
                        value: EndeavorBlockType.single,
                        child: Text("One Time"),
                      ),
                      DropdownMenuItem(
                        value: EndeavorBlockType.repeating,
                        child: Text("Repeated"),
                      )
                    ],
                    onChanged: (value) {
                      setState(() {
                        endeavorBlock.type = value;
                      });
                    },
                  )
                ],
              ),
              // One time endeavor block picker
              if (endeavorBlock.type == EndeavorBlockType.single)
                OneTimeEventPicker(
                    event: (endeavorBlock as OneTimeEndeavorBlock).event!),
              // repeating endeavor block picker
              // Submit button
              ElevatedButton(
                onPressed: () {
                  // make sure end is after beginning
                  if (endeavorBlock.validate()) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.uid)
                        .collection('endeavorBlocks')
                        .add(
                      {
                        'endeavorId': endeavorBlock.endeavorId,
                        'type': endeavorBlock.type.toString(),
                        'start': (endeavorBlock as OneTimeEndeavorBlock)
                            .event!
                            .start!
                            .toString(),
                        'end': (endeavorBlock as OneTimeEndeavorBlock)
                            .event!
                            .end!
                            .toString(),
                      },
                    );
                  }
                  widget.setCalendarView(CalendarView.week,
                      (endeavorBlock as OneTimeEndeavorBlock).event!.start!);
                  Navigator.pop(context);
                },
                child: const Text("Add Block"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
