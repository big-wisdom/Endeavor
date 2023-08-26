import 'package:data_models/data_models.dart';
import 'package:endeavor/endeavor_selection_screen/view/endeavor_selection_screen.dart';
import 'package:flutter/material.dart';

class EndeavorPickerRow extends StatelessWidget {
  const EndeavorPickerRow({
    required this.endeavorInput,
    required this.onChanged,
    super.key,
  });

  final EndeavorPickerRowInput endeavorInput;
  final void Function(Endeavor? endeavor) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Endeavor:"),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EndeavorSelectionScreen(
                      initiallySelectedEndeavorInput: endeavorInput,
                      onChanged: onChanged,
                    );
                  },
                ),
              ),
              child: Text(endeavorInput.value?.title ?? "Add Endeavor"),
            )
          ],
        ),
        if (endeavorInput.error != null)
          Text(
            endeavorInput.error!.errorText(),
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
