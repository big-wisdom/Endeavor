import 'package:data_repository/data_repository.dart'
    show Endeavor, EndeavorPickerRowInput, TreeOfLife;
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
  final TreeOfLife? endeavorTreeOfLife;
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
                  treeOfLife: endeavorTreeOfLife,
                  initiallySelectedEndeavorInput: endeavorInput,
                  onChanged: onChanged,
                );
              },
            ),
          ),
          child: Text(endeavorInput.value?.title ?? "Add Endeavor"),
        )
      ],
    );
  }
}
