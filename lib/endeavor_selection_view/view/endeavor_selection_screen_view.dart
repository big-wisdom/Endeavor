import 'package:endeavor/task_screen/bloc/task_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:endeavor/tasks_screen/tasks_screen.dart' show TasksScreenBloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'endeavor_selection_tile.dart';

class EndeavorSelectionScreenView extends StatelessWidget {
  const EndeavorSelectionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final treeOfLife = context.read<TasksScreenBloc>().state.treeOfLife;

    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Endeavor primaryEndeavor = treeOfLife[index];
          return EndeavorSelectionTile(
            endeavor: primaryEndeavor,
            selected: context.read<TaskScreenBloc>().state.endeavorId.value ==
                primaryEndeavor.id,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
          );
        },
        itemCount: treeOfLife.length,
      ),
    );
  }
}
