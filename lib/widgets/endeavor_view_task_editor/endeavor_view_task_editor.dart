import 'package:endeavor/task_screen/task_screen.dart';
import 'package:endeavor/widgets/endeavor_view_task_editor/task_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:endeavor/endeavor_screen/endeavor_screen.dart';

class EndeavorViewTaskEditor extends StatelessWidget {
  const EndeavorViewTaskEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorScreenBloc, EndeavorScreenState>(
      buildWhen: ((previous, current) => previous.tasks == current.tasks),
      builder: (context, state) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          const Text("Tasks"),
          SingleChildScrollView(
            child: ReorderableListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              onReorder: (oldIndex, newIndex) => context
                  .read<EndeavorScreenBloc>()
                  .add(ReorderTasks(oldIndex, newIndex)),
              children:
                  state.tasks.map((task) => TaskListTile(task: task)).toList(),
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
