import 'package:endeavor/schedule_editor/view/schedule_editor_view.dart';
import 'package:endeavor/schedule_screen/bloc/schedule_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ScheduleScreenView extends StatelessWidget {
  const ScheduleScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ScheduleScreenCubit>();
    return Scaffold(
      body: SafeArea(
        child: FormBlocListener<ScheduleScreenCubit, String, String>(
          onSubmitting: (context, _) => Navigator.of(context).pop(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldBlocBuilder(textFieldBloc: bloc.title),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ScheduleEditorView(),
                  ),
                ),
                child: const Text("Adjust Schedule"),
              ),
              ElevatedButton(
                onPressed: bloc.state.isValid() ? bloc.submit : null,
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
