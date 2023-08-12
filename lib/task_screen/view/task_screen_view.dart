import 'package:duration_picker/duration_picker.dart';
import 'package:endeavor/one_time_event_picker_screen/one_time_event_picker_screen.dart';
import 'package:data_models/data_models.dart';
import 'package:endeavor/widgets/endeavor_picker_row.dart';
import 'package:formz/formz.dart';

import '../bloc/task_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreenView extends StatelessWidget {
  const TaskScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                state is! CreateTaskScreenState ? "Edit Task" : "Create Task"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state is LoadingEditTaskScreenState
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          _TitleInput(),
                          _EndeavorSwitcher(),
                          _DurationSelector(),
                          _DivisibilityCheckbox(),
                          _MinnimumDurationPicker(),
                          if (state.scheduledEvents.value.isEmpty) _Schedule(),
                          _TaskEventListEditor(),
                          _SaveButton(),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
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
      buildWhen: (previous, current) =>
          previous.divisible != current.divisible ||
          previous.duration.value != current.duration.value ||
          previous.minnimumSchedulingDuration.value !=
              current.minnimumSchedulingDuration.value,
      builder: (context, state) {
        if (state.duration.value == null) return Container();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
            ),
            if (state.divisible.error != null)
              Text(
                state.divisible.error!.text(),
                style: const TextStyle(color: Colors.red),
              )
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
      buildWhen: (previous, current) =>
          previous.minnimumSchedulingDuration !=
              current.minnimumSchedulingDuration ||
          previous.divisible != current.divisible ||
          previous.duration != current.duration,
      builder: (context, state) {
        if (state.divisible.value == null ||
            (state.divisible.value != null && !state.divisible.value!)) {
          return Container();
        }

        final bloc = context.read<TaskScreenBloc>();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Minnimum Scheduling Duration"),
                TextButton(
                  onPressed: () async {
                    final resultingDuration = await showDurationPicker(
                      context: context,
                      initialTime: state.minnimumSchedulingDuration.value ??
                          Duration.zero,
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
            ),
            if (state.minnimumSchedulingDuration.error != null)
              Text(
                state.minnimumSchedulingDuration.error!.text(),
                style: const TextStyle(color: Colors.red),
              ),
          ],
        );
      },
    );
  }
}

// TODO: the event isn't getting the right time
class _Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      builder: (context, state) {
        final taskScreenBloc = context.read<TaskScreenBloc>();
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
                          onEvent: (newEvent) =>
                              taskScreenBloc.add(EventCreated(newEvent)),
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
          previous.scheduledEvents != current.scheduledEvents,
      builder: (context, state) {
        if (state.scheduledEvents.value.isEmpty) return Container();

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
                    if (state.unscheduledDuration != null)
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
                      .scheduledEvents.value[index].start.millisecondsSinceEpoch
                      .toString()),
                  onDismissed: (direction) {
                    context.read<TaskScreenBloc>().add(
                          EventDeleted(state.scheduledEvents.value[index]),
                        );
                  },
                  child: ListTile(
                    title: Text(
                        "${state.scheduledEvents.value[index].duration.inMinutes} minutes"),
                    subtitle: Text(
                      state.scheduledEvents.value[index].getDescription(),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                );
              },
              itemCount: state.scheduledEvents.value.length,
            ),
            TextButton(
              onPressed: () {
                final taskScreenBloc = context.read<TaskScreenBloc>();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OneTimeEventPickerScreen(onEvent: (event) {
                        taskScreenBloc.add(EventCreated(event));
                        Navigator.pop(context);
                      });
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

class _SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskScreenBloc, TaskScreenState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status == FormzStatus.valid
              ? () {
                  context.read<TaskScreenBloc>().add(const SaveButtonTapped());
                  Navigator.pop(context);
                }
              : null,
          child: const Text("Save"),
        );
      },
    );
  }
}
