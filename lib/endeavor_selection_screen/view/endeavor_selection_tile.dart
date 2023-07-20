import 'package:flutter/material.dart';
import 'package:data_repository/data_repository.dart' show EndeavorNode;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/endeavor_selection_screen_cubit.dart';

class EndeavorSelectionTile extends StatelessWidget {
  final EndeavorNode endeavorNode;
  final bool selected;

  const EndeavorSelectionTile(
      {required this.endeavorNode, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    if (endeavorNode.subEndeavors.isEmpty) {
      return ListTile(
        title: Text(endeavorNode.endeavor.title),
        selected: selected,
        onTap: () => context
            .read<EndeavorSelectionScreenCubit>()
            .endeavorSelected(endeavorNode.endeavor),
      );
    } else {
      return ExpansionTile(
        title: GestureDetector(
          child: Text(
            endeavorNode.endeavor.title,
          ),
          onTap: () => context
              .read<EndeavorSelectionScreenCubit>()
              .endeavorSelected(endeavorNode.endeavor),
        ),
        textColor: selected ? Colors.blue : Colors.black,
        collapsedTextColor: selected ? Colors.blue : Colors.black,
        controlAffinity: ListTileControlAffinity.leading,
        children: endeavorNode.subEndeavors.map(
          (e) {
            final String? selectedId = context
                .read<EndeavorSelectionScreenCubit>()
                .state
                .selectedEndeavorInput
                .value
                ?.id;
            final bool selected =
                selectedId == null ? false : selectedId == e.endeavor.id;
            return EndeavorSelectionTile(
              endeavorNode: e,
              selected: selected,
            );
          },
        ).toList(),
      );
    }
  }
}
