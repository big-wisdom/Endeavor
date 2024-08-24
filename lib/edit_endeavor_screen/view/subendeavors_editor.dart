import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';
import 'package:endeavor/widgets/create_with_title_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubEndeavorsEditor extends StatelessWidget {
  const SubEndeavorsEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEndeavorScreenBloc, EditEndeavorScreenState>(
      buildWhen: (previous, current) {
        previous as LoadedEditEndeavorScreenState;
        current as LoadedEditEndeavorScreenState;
        return previous.subEndeavorsInput.value !=
            current.subEndeavorsInput.value;
      },
      builder: (context, state) {
        state as LoadedEditEndeavorScreenState;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Sub-Endeavors"),
            _SubEndeavorsList(),
            TextButton(
                onPressed: () {
                  final editEndeavorBloc =
                      context.read<EditEndeavorScreenBloc>();
                  showModalBottomSheet(
                    context: context,
                    builder: (newContext) {
                      return CreateWithTitleModal(
                        onAdd: (newEndeavorTitle) => editEndeavorBloc.add(
                          CreateSubEndeavorRequested(newEndeavorTitle),
                        ),
                      );
                    },
                  );
                },
                child: const Text("Add Sub-Endeavor")),
          ],
        );
      },
    );
  }
}

class _SubEndeavorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEndeavorScreenBloc, EditEndeavorScreenState>(
      buildWhen: (previous, current) {
        previous as LoadedEditEndeavorScreenState;
        current as LoadedEditEndeavorScreenState;
        return previous.subEndeavorsInput != current.subEndeavorsInput;
      },
      builder: (context, state) {
        state as LoadedEditEndeavorScreenState;
        return ReorderableListView(
          shrinkWrap: true,
          onReorder: (oldIndex, newIndex) => context
              .read<EditEndeavorScreenBloc>()
              .add(ReorderSubEndeavors(oldIndex, newIndex)),
          children: state.subEndeavorsInput.value.map((endeavorReference) {
            return Dismissible(
              key: Key(endeavorReference.id.toString()),
              child: ListTile(
                title: Text(endeavorReference.title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditEndeavorScreen.fromEndeavorReference(
                          endeavorReference: endeavorReference,
                        );
                      },
                    ),
                  );
                },
              ),
              onDismissed: (direction) {
                context.read<EditEndeavorScreenBloc>().add(
                      DeleteEndeavorRequested(endeavorReference),
                    );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
