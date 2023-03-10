import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:endeavor/Models/task.dart';
import 'package:endeavor/widgets/endeavor_dropdown_button.dart';
import 'package:flutter/material.dart';

class CreateOrEditTask extends StatefulWidget {
  const CreateOrEditTask._({this.task, required this.uid, super.key});

  factory CreateOrEditTask.create({required uid, key}) {
    return CreateOrEditTask._(
      uid: uid,
      key: key,
    );
  }

  factory CreateOrEditTask.edit({required task, required uid, key}) {
    return CreateOrEditTask._(task: task, uid: uid);
  }

  final String uid;
  final Task? task; // we can know whether we are creating or updating by this

  @override
  State<CreateOrEditTask> createState() => _CreateOrEditTaskState();
}

class _CreateOrEditTaskState extends State<CreateOrEditTask> {
  final _formKey = GlobalKey<FormState>();
  late Task task;
  late bool editing;

  @override
  void initState() {
    if (widget.task != null) {
      task = widget.task!;
      editing = true;
    } else {
      task = Task();
      editing = false;
    }

    super.initState();
  }

  bool _tryCreate() {
    final formIsValid = _formKey.currentState?.validate();
    final taskIsValid = task.validate();
    FocusScope.of(context).unfocus();

    if (formIsValid != null && formIsValid && taskIsValid) {
      FirebaseFirestore.instance.runTransaction((t) async {
        // add the task to the task collection and save the docRef
        final taskDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .collection('tasks')
            .add(task.toDoc());

        // if it is assigned to an endeavor, add it to its tasks
        if (task.endeavorId != null) {
          // get endeavor doc
          final endeavorDocRef = FirebaseFirestore.instance
              .collection('users')
              .doc(widget.uid)
              .collection('endeavors')
              .doc(task.endeavorId);
          final docSnap = await t.get(endeavorDocRef);

          // add to tasks list or create it
          final docSnapData = docSnap.data()!;
          List<String> taskIds;
          if (docSnapData['taskIds'] != null) {
            taskIds = (docSnapData['taskIds'] as List)
                .map((taskId) => taskId as String)
                .toList();
            taskIds.add(taskDoc.id);
          } else {
            taskIds = [taskDoc.id];
          }
          t.update(endeavorDocRef, {'taskIds': taskIds});
        }
      });
      return true;
    } else {
      return false;
    }
  }

  void _endeavorChanged(String? endeavorId) {
    String? oldEndeavorId = task.endeavorId;
    task.endeavorId = endeavorId;
    if (editing) {
      FirebaseFirestore.instance.runTransaction<bool>((t) async {
        // if it was part of an endeavor, remove it
        if (oldEndeavorId != null) {
          t.update(
            FirebaseFirestore.instance
                .collection('users')
                .doc(widget.uid)
                .collection('endeavors')
                .doc(oldEndeavorId),
            {
              'taskIds': FieldValue.arrayRemove([task.id])
            },
          );
        }

        // change the endeavorId on a task
        t.update(
          FirebaseFirestore.instance
              .collection('users')
              .doc(widget.uid)
              .collection('tasks')
              .doc(task.id),
          {'endeavorId': task.endeavorId},
        );

        // add it to the endeavor it is now a part of
        if (task.endeavorId != null) {
          t.update(
            FirebaseFirestore.instance
                .collection('users')
                .doc(widget.uid)
                .collection('endeavors')
                .doc(task.endeavorId),
            {
              'taskIds': FieldValue.arrayUnion([task.id])
            },
          );
        }
        return true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Title field
                TextFormField(
                  initialValue: task.title,
                  decoration: const InputDecoration(
                    labelText: "Title",
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    task.title = value;
                  },
                  onTapOutside: editing
                      ? (event) {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(widget.uid)
                              .collection('tasks')
                              .doc(task.id)
                              .update({'title': task.title});
                        }
                      : null,
                ),
                // Endeavor switcher
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Endeavor"),
                    EndeavorsDropdownButton(
                      firstValue: task.endeavorId,
                      uid: widget.uid,
                      onChanged: (endeavorId) => _endeavorChanged(endeavorId),
                      nullOption: true,
                    ),
                  ],
                ),
                // Duration selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Duration"),
                    TextButton(
                      onPressed: () async {
                        final resultingDuration = await showDurationPicker(
                            context: context,
                            initialTime: task.duration ?? Duration.zero);
                        setState(() {
                          task.duration = resultingDuration;
                        });
                        if (editing && resultingDuration != null) {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(widget.uid)
                              .collection('tasks')
                              .doc(task.id)
                              .update(
                                  {'duration': resultingDuration.inMinutes});
                        }
                      },
                      child: Text(task.duration?.toString() ?? "Add duration"),
                    ),
                  ],
                ),
                // Schedule
                Row(
                  children: [
                    const Text("Schedule"),
                    TextButton(
                      onPressed: () {},
                      child: Text(task.start?.toString() ?? "Schedule task"),
                    ),
                  ],
                ),
                // Add button
                if (!editing)
                  ElevatedButton(
                    onPressed: () {
                      if (_tryCreate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Add"),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
