import 'package:endeavor/create_or_edit_endeavor_screen/create_or_edit_endeavor_screen.dart';
import 'package:endeavor/endeavor_settings_screen/endeavor_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrEditEndeavorScreenView extends StatelessWidget {
  const CreateOrEditEndeavorScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<CreateOrEditEndeavorScreenBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(state.isEditing ? state.endeavor.title! : "New Endeavor"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EndeavorSettingsScreen(context
                    .read<CreateOrEditEndeavorScreenBloc>()
                    .settingsStream);
              }));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sub Endeavors
            SubEndeavorsEditor(endeavor: state.endeavor),
            EndeavorViewTaskEditor(
              endeavor: state.endeavor,
              tasks: tasks,
            ),
          ],
        ),
      ),
    );
  }
}
