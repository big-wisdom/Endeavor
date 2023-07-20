import 'package:data_repository/data_repository.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:endeavor/one_time_event_picker_screen/one_time_event_picker_screen.dart';
import 'package:endeavor/util.dart';
import 'package:endeavor/widgets/endeavor_picker_row.dart';

import '../bloc/task_screen_bloc.dart';
import '../bloc/edit_task_screen_bloc/edit_task_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreenView extends StatelessWidget {
  const TaskScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TaskScreenBloc>();
    final isEditing = bloc is EditTaskScreenBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Task" : "Create Task"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _TitleInput(),
                _EndeavorSwitcher(),
                _DurationSelector(),
                _DivisibilityCheckbox(),
                _MinnimumDurationPicker(),
                if (bloc.state.scheduledEvents.isEmpty) _Schedule(),
                if (bloc.state.scheduledEvents.isNotEmpty)
                  _TaskEventListEditor(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title.value,
          decoration: const InputDecoration(
            labelText: "Title",
          ),
          validator: (value) => state.title.error?.text(),
          onChanged: (value) =>
              context.read<TaskScreenBloc>().add(TitleChanged(value)),
        );
      },
    );
  }
}

class _EndeavorSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      buildWhen: (previous, current) => previous.endeavor != current.endeavor,
      builder: (context, state) => EndeavorPickerRow(
        endeavorInput: state.endeavor,
        endeavorTreeOfLife: state.treeOfLife,
        onChanged: (endeavor) =>
            context.read<TaskScreenBloc>().add(EndeavorSelected(endeavor)),
      ),
    );
  }
}

class _DurationSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      buildWhen: (previous, current) => previous.duration != current.duration,
      builder: (context, state) {
        final bloc = context.read<TaskScreenBloc>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Duration"),
            TextButton(
              onPressed: () async {
                final resultingDuration = await showDurationPicker(
                  context: context,
                  initialTime: state.duration.value ?? Duration.zero,
                  snapToMins: 5.0,
                );

                if (resultingDuration != null) {
                  bloc.add(DurationChanged(resultingDuration));
                }
              },
              child: Text(state.duration.value?.toString() ?? "Add duration"),
            ),
          ],
        );
      },
    );
  }
}

class _DivisibilityCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      buildWhen: (previous, current) => previous.divisible != current.divisible,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Divisible:"),
            Checkbox(
              value: state.divisible.value ?? false,
              onChanged: (value) {
                if (value != null) {
                  context
                      .read<TaskScreenBloc>()
                      .add(DivisibilityChanged(value));
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class _MinnimumDurationPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      builder: (context, state) {
        final bloc = context.read<TaskScreenBloc>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Minnimum Scheduling Duration"),
            TextButton(
              onPressed: () async {
                final resultingDuration = await showDurationPicker(
                  context: context,
                  initialTime:
                      state.minnimumSchedulingDuration.value ?? Duration.zero,
                );
                if (resultingDuration != null) {
                  bloc.add(
                      MinnimumSchedulingDurationChanged(resultingDuration));
                }
              },
              child: Text(
                state.minnimumSchedulingDuration.value?.toString() ??
                    "Add duration",
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Schedule"),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OneTimeEventPickerScreen(
                          onEvent: (newEvent) => context
                              .read<TaskScreenBloc>()
                              .add(EventCreated(newEvent)),
                        );
                      },
                    ),
                  );
                },
                child: const Text("Add Date and Time"))
          ],
        );
      },
    );
  }
}

class _TaskEventListEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      buildWhen: (previous, current) =>
          previous.scheduledEvents != previous.scheduledEvents,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Scheduled Work Blocks",
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        "Scheduled: ${state.scheduledDuration.inMinutes} minutes"),
                    Text(
                        "Unscheduled: ${state.unscheduledDuration!.inMinutes} minutes"),
                  ],
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(state
                      .scheduledEvents[index].start.millisecondsSinceEpoch
                      .toString()),
                  onDismissed: (direction) {
                    context.read<TaskScreenBloc>().add(
                          EventDeleted(state.scheduledEvents[index]),
                        );
                  },
                  child: ListTile(
                    title: Text(
                        "${state.scheduledEvents[index].duration.inMinutes} minutes"),
                    subtitle: Text(
                      getEventDescription(state.scheduledEvents[index]),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                );
              },
              itemCount: state.scheduledEvents.length,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OneTimeEventPickerScreen(
                        onEvent: (event) => context
                            .read<TaskScreenBloc>()
                            .add(EventCreated(event)),
                      );
                    },
                  ),
                );
              },
              child: const Text("Add Work Block"),
            )
          ],
        );
      },
    );
  }
}
