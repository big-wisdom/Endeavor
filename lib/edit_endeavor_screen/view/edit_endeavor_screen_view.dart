import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';
import 'package:endeavor/edit_endeavor_screen/view/endeavor_view_task_editor/endeavor_view_task_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'endeavor_settings_screen_view.dart';
import 'subendeavors_editor.dart';

class EditEndeavorScreenView extends StatelessWidget {
  const EditEndeavorScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEndeavorScreenBloc, EditEndeavorScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.title),
            actions: [
              if (state is! LoadingEditEndeavorScreenState)
                IconButton(
                  onPressed: () {
                    final bloc = context.read<EditEndeavorScreenBloc>();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return EndeavorSettingsScreenView(
                            selectedColor:
                                (state as LoadedEditEndeavorScreenState)
                                        .color ??
                                    Theme.of(context).primaryColor,
                            onChanged: (Color newColor) =>
                                bloc.add(ColorChanged(newColor)),
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings),
                ),
            ],
          ),
          body: state is LoadingEditEndeavorScreenState
              ? const Center(
                  child: Text("loading..."),
                )
              : const SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SubEndeavorsEditor(),
                      EndeavorViewTaskEditor(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
