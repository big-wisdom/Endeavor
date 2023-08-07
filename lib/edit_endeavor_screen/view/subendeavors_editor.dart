import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';
import 'package:endeavor/widgets/create_endeavor_modal.dart';
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
                      return CreateEndeavorModal(
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
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(state.subEndeavorsInput.value[index].id),
              child: ListTile(
                title: Text(state.subEndeavorsInput.value[index].title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditEndeavorScreen.fromEndeavorReference(
                          endeavorReference:
                              state.subEndeavorsInput.value[index],
                        );
                      },
                    ),
                  );
                },
              ),
              onDismissed: (direction) {
                context.read<EditEndeavorScreenBloc>().add(
                      DeleteEndeavorRequested(
                        state.subEndeavorsInput.value[index],
                      ),
                    );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          },
          itemCount: state.subEndeavorsInput.value.length,
        );
      },
    );
  }
}
