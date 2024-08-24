import 'package:flutter/material.dart';

class CreateWithTitleModal extends StatelessWidget {
  const CreateWithTitleModal({required this.onAdd, super.key});

  final Function(String) onAdd;

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
              onPressed: () async {
                final isValid = formKey.currentState?.validate();
                FocusScope.of(context).unfocus();
                if (isValid != null && isValid) {
                  formKey.currentState?.save();
                  onAdd(text);
                  Navigator.pop(context);
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
