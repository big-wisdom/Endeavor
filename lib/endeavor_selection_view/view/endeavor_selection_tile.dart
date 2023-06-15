import 'package:flutter/material.dart';
import 'package:data_repository/data_repository.dart' show Endeavor;
import 'package:endeavor/task_screen/task_screen.dart'
    show TaskScreenBloc, EndeavorSelected;
import 'package:flutter_bloc/flutter_bloc.dart';

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
        onTap: () =>
            context.read<TaskScreenBloc>().add(EndeavorSelected(endeavor)),
      );
    } else {
      return ExpansionTile(
        title: GestureDetector(
          child: Text(
            endeavor.title!,
          ),
          onTap: () =>
              context.read<TaskScreenBloc>().add(EndeavorSelected(endeavor)),
        ),
        textColor: selected ? Colors.blue : Colors.black,
        collapsedTextColor: selected ? Colors.blue : Colors.black,
        controlAffinity: ListTileControlAffinity.leading,
        children: endeavor.subEndeavors!
            .map((e) => EndeavorSelectionTile(
                  endeavor: e,
                  selected:
                      context.read<TaskScreenBloc>().state.endeavorId.value ==
                          e.id,
                ))
            .toList(),
      );
    }
  }
}
