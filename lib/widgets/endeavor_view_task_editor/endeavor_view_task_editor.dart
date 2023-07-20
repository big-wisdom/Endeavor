import 'package:endeavor/task_screen/task_screen.dart';
import 'package:endeavor/widgets/endeavor_view_task_editor/task_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';

class EndeavorViewTaskEditor extends StatelessWidget {
  const EndeavorViewTaskEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEndeavorScreenBloc, EditEndeavorScreenState>(
      buildWhen: ((previous, current) {
        previous as LoadedEditEndeavorScreenState;
        current as LoadedEditEndeavorScreenState;
        return previous.tasksInput == current.tasksInput;
      }),
      builder: (context, state) {
        state as LoadedEditEndeavorScreenState;
        return Column(mainAxisSize: MainAxisSize.min, children: [
          const Text("Tasks"),
          SingleChildScrollView(
            child: ReorderableListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              onReorder: (oldIndex, newIndex) => context
                  .read<EditEndeavorScreenBloc>()
                  .add(ReorderTasks(oldIndex, newIndex)),
              children: state.tasksInput.value
                  .map((task) => TaskListTile(taskReference: task))
                  .toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TaskScreen.create();
                  },
                ),
              );
            },
            child: const Text("Add"),
          ),
        ]);
      },
    );
  }
}
