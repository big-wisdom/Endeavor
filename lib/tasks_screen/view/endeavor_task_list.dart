import 'package:data_models/data_models.dart';
import 'package:endeavor/tasks_screen/bloc/tasks_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_list_tile.dart';

class EndeavorTaskList extends StatefulWidget {
  const EndeavorTaskList({required this.endeavorNode, super.key});

  final EndeavorNode endeavorNode;

  @override
  State<EndeavorTaskList> createState() => _EndeavorTaskListState();
}

class _EndeavorTaskListState extends State<EndeavorTaskList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: Text(widget.endeavorNode.endeavor.title),
      trailing: TextButton(
        onPressed: () => context
            .read<TasksScreenBloc>()
            .add(PlanRequested(widget.endeavorNode.endeavor)),
        child: const Text("Plan"),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      children: [
        // tasks
        ...widget.endeavorNode.endeavor.taskReferences
            .map((taskRef) => TaskListTile(
                  taskReference: taskRef,
                  key: Key(taskRef.id.toString()),
                ))
            .toList(),
        // subendeavors
        ...widget.endeavorNode.subEndeavors
            .map((endeavorNode) => EndeavorTaskList(endeavorNode: endeavorNode))
            .toList(),
      ],
    );
  }
}
