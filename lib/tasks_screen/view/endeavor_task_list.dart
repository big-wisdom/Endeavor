import 'package:endeavor/tasks_screen/bloc/tasks_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_list_tile.dart';

class EndeavorTaskList extends StatefulWidget {
  const EndeavorTaskList({required this.endeavor, super.key});

  final Endeavor endeavor;

  @override
  State<EndeavorTaskList> createState() => _EndeavorTaskListState();
}

class _EndeavorTaskListState extends State<EndeavorTaskList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(widget.endeavor.title!),
      trailing: TextButton(
        onPressed: () =>
            context.read<TasksScreenBloc>().add(PlanRequested(widget.endeavor)),
        child: const Text("Plan"),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      children: [
        // subendeavors
        if (widget.endeavor.subEndeavors != null)
          ListView.builder(
            itemCount: widget.endeavor.subEndeavors!.length,
            itemBuilder: (context, index) {
              return EndeavorTaskList(
                  endeavor: widget.endeavor.subEndeavors![index]);
            },
          ),
        // tasks
        if (widget.endeavor.tasks != null)
          ListView.builder(
            itemCount: widget.endeavor.tasks!.length,
            itemBuilder: (context, index) {
              return TaskListTile(task: widget.endeavor.tasks![index]);
            },
          ),
      ],
    );
  }
}
