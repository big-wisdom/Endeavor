import 'package:data_repository/data_repository.dart'
    show Endeavor, EndeavorPickerRowInput;
import 'package:endeavor/endeavor_selection_screen/view/endeavor_selection_screen.dart';
import 'package:flutter/material.dart';

class EndeavorPickerRow extends StatelessWidget {
  const EndeavorPickerRow({
    required this.endeavorInput,
    this.endeavorTreeOfLife,
    required this.onChanged,
    super.key,
  });

  final EndeavorPickerRowInput endeavorInput;
  final List<Endeavor>? endeavorTreeOfLife;
  final void Function(Endeavor endeavor) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Endeavor:"),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EndeavorSelectionScreen(
                  endeavorTreeOfLife: endeavorTreeOfLife,
                  endeavorInput: endeavorInput,
                  onChanged: onChanged,
                );
              },
            ),
          ),
          child: Text(endeavorInput.value?.endeavorTitle ?? "Add Endeavor"),
        )
      ],
    );
  }
}
