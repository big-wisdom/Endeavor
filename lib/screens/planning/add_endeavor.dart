import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddEndeavor extends StatefulWidget {
  const AddEndeavor({required this.user, super.key});

  final User user;

  @override
  State<AddEndeavor> createState() => _AddEndeavorState();
}

class _AddEndeavorState extends State<AddEndeavor> {
  @override
  Widget build(BuildContext context) {
    var text = '';
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Text:'),
              validator: (value) {
                if (value == null || value == "") {
                  return "Can't be empty";
                }
                return null;
              },
              onSaved: (value) {
                if (value != null) text = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                final isValid = formKey.currentState?.validate();
                FocusScope.of(context).unfocus();
                if (isValid != null && isValid) {
                  formKey.currentState?.save();
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.user.uid)
                      .collection('endeavors')
                      .add({"text": text});
                }
              },
              child: const Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
