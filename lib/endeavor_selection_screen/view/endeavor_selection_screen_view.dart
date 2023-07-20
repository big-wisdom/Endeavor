import '../cubit/endeavor_selection_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'endeavor_selection_tile.dart';

class EndeavorSelectionScreenView extends StatelessWidget {
  const EndeavorSelectionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<EndeavorSelectionScreenCubit>().state;
    if (state.treeOfLife == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          EndeavorNode primaryEndeavorNode =
              state.treeOfLife!.primaryEndeavorNodes[index];
          return EndeavorSelectionTile(
            endeavorNode: primaryEndeavorNode,
            selected: state.selectedEndeavorInput.value == null
                ? false
                : state.selectedEndeavorInput.value!.id ==
                    primaryEndeavorNode.endeavor.id,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
          );
        },
        itemCount: state.treeOfLife!.primaryEndeavorNodes.length,
      ),
    );
  }
}
