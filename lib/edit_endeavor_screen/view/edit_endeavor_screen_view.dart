import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';
import 'package:endeavor/widgets/endeavor_view_task_editor/endeavor_view_task_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'endeavor_settings_screen_view.dart';
import 'subendeavors_editor.dart';

class EditEndeavorScreenView extends StatelessWidget {
  const EditEndeavorScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<EditEndeavorScreenBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(state.title),
        actions: [
          if (state is! LoadingEditEndeavorScreenState)
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const EndeavorSettingsScreenView();
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
              child: CircularProgressIndicator(),
            )
          : const SingleChildScrollView(
              child: Column(
                children: [
                  SubEndeavorsEditor(),
                  EndeavorViewTaskEditor(),
                ],
              ),
            ),
    );
  }
}
