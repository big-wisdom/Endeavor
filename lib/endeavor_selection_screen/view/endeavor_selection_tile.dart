import 'package:flutter/material.dart';
import 'package:data_repository/data_repository.dart' show Endeavor;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/endeavor_selection_screen_cubit.dart';

class EndeavorSelectionTile extends StatelessWidget {
  final Endeavor endeavor;
  final bool selected;

  const EndeavorSelectionTile(
      {required this.endeavor, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    if (endeavor.subEndeavors == null || endeavor.subEndeavors!.isEmpty) {
      return ListTile(
        title: Text(endeavor.title!),
        selected: selected,
        onTap: () => context
            .read<EndeavorSelectionScreenCubit>()
            .endeavorSelected(endeavor),
      );
    } else {
      return ExpansionTile(
        title: GestureDetector(
          child: Text(
            endeavor.title!,
          ),
          onTap: () => context
              .read<EndeavorSelectionScreenCubit>()
              .endeavorSelected(endeavor),
        ),
        textColor: selected ? Colors.blue : Colors.black,
        collapsedTextColor: selected ? Colors.blue : Colors.black,
        controlAffinity: ListTileControlAffinity.leading,
        children: endeavor.subEndeavors!.map(
          (e) {
            final String? selectedId = context
                .read<EndeavorSelectionScreenCubit>()
                .state
                .endeavorInput
                .value;
            final bool selected =
                selectedId == null ? false : selectedId == e.id!;
            return EndeavorSelectionTile(
              endeavor: e,
              selected: selected,
            );
          },
        ).toList(),
      );
    }
  }
}
