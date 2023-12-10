import 'package:data_models/data_models.dart';
import 'package:endeavor/endeavor_selection_screen_flutter_form/view/endeavor_selection_screen.dart';
import 'package:flutter/material.dart';

class EndeavorPickerRow extends StatelessWidget {
  const EndeavorPickerRow({
    required this.initialValue,
    required this.onChanged,
    required this.nullable,
    super.key,
  });

  final EndeavorReference? initialValue;
  final void Function(EndeavorReference? endeavor) onChanged;
  final bool nullable;

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
                      initialValue: initialValue,
                      onChanged: onChanged,
                      nullable: nullable,
                    );
                  },
                ),
              ),
              child: Text(initialValue?.title ?? "Add Endeavor"),
            )
          ],
        ),
        if (initialValue == null && !nullable)
          const Text(
            "An endevor must be selected",
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
