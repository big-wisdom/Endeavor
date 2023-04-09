import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/tasks/create_or_edit_task.dart';
import 'package:endeavor/screens/planning/tasks/task_list.dart';
import 'package:flutter/material.dart';

class EndeavorViewTaskEditor extends StatefulWidget {
  const EndeavorViewTaskEditor(
      {required this.endeavorId,
      required this.uid,
      required this.tasks,
      super.key});

  final String endeavorId;
  final String uid;
  final List<Task> tasks;

  @override
  State<EndeavorViewTaskEditor> createState() => _EndeavorViewTaskEditorState();
}

class _EndeavorViewTaskEditorState extends State<EndeavorViewTaskEditor> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const Text("Tasks"),
      TaskList(
        endeavorId: widget.endeavorId,
        uid: widget.uid,
        tasks: widget.tasks,
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateOrEditTask.create(
                    endeavorId: widget.endeavorId, uid: widget.uid);
              },
            ),
          );
        },
        child: const Text("Add"),
      ),
    ]);
  }
}
