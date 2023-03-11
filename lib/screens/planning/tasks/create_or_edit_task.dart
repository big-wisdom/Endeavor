import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/task.dart';
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

  @override
  void initState() {
    if (widget.task != null) {
      task = widget.task!;
    } else {
      task = Task();
    }

    super.initState();
  }

  bool _tryCreate() {
    final formIsValid = _formKey.currentState?.validate();
    final taskIsValid = task.validate();
    FocusScope.of(context).unfocus();

    if (formIsValid != null && formIsValid && taskIsValid) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .collection('tasks')
          .add(task.toDoc());
      return true;
    } else {
      return false;
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
                ),
                // Add button
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
