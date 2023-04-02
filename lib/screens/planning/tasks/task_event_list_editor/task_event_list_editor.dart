import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/tasks/task_event_list_editor/one_time_event_picker_view.dart';
import 'package:endeavor/screens/planning/tasks/task_event_list_editor/task_event_list_editor_tile.dart';
import 'package:flutter/material.dart';

class TaskEventListEditor extends StatefulWidget {
  const TaskEventListEditor(
      {required this.task, required this.onChanged, super.key});

  final Task task;
  final void Function() onChanged;

  @override
  State<TaskEventListEditor> createState() => _TaskEventListEditorState();
}

class _TaskEventListEditorState extends State<TaskEventListEditor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Scheduled Work Blocks",
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "Scheduled: ${widget.task.scheduledDuration!.inMinutes} minutes"),
                Text(
                    "Unscheduled: ${widget.task.unscheduledDuration!.inMinutes} minutes"),
              ],
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Dismissible(
                key: Key(widget
                    .task.events![index].start!.millisecondsSinceEpoch
                    .toString()),
                onDismissed: (direction) {
                  setState(() {
                    widget.task.events!.remove(widget.task.events![index]);
                    if (widget.task.events!.isEmpty) {
                      widget.task.events = null;
                    }
                    widget.onChanged();
                  });
                },
                child:
                    TaskEventListEditorTile(event: widget.task.events![index]));
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          },
          itemCount: widget.task.events!.length,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OneTimeEventPickerView(
                    task: widget.task,
                    onDone: (newEvent) {
                      setState(() {
                        widget.task.events!.add(newEvent);
                        widget.onChanged();
                      });
                    },
                  );
                },
              ),
            );
          },
          child: const Text("Add Work Block"),
        )
      ],
    );
  }
}
