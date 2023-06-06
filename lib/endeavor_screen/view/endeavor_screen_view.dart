import 'package:endeavor/endeavor_screen/endeavor_screen.dart';
import 'package:endeavor/endeavor_settings_screen/endeavor_settings_screen.dart';
import 'package:endeavor/widgets/endeavor_view_task_editor/endeavor_view_task_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'subendeavors_editor.dart';

class CreateOrEditEndeavorScreenView extends StatelessWidget {
  const CreateOrEditEndeavorScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<EndeavorScreenBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(state.isEditing ? state.endeavor.title! : "New Endeavor"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return EndeavorSettingsScreen(state.endeavor);
                  },
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Sub Endeavors
            SubEndeavorsEditor(),
            EndeavorViewTaskEditor(),
          ],
        ),
      ),
    );
  }
}
