import 'package:endeavor/Models/Endeavor/endeavor.dart';
import 'package:flutter/material.dart';

class EndeavorSelectionTile extends StatefulWidget {
  const EndeavorSelectionTile(
      {required this.endeavor,
      required this.onSelected,
      required this.selectedEndeavorId,
      required this.expandedIds,
      required this.onExpansionChanged,
      super.key});

  final Endeavor endeavor;
  final String? selectedEndeavorId;
  final void Function(String?) onSelected;
  final Set<String> expandedIds;
  final void Function(String, bool) onExpansionChanged;

  @override
  State<EndeavorSelectionTile> createState() => _EndeavorSelectionTileState();
}

class _EndeavorSelectionTileState extends State<EndeavorSelectionTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.endeavor.subEndeavors == null ||
        widget.endeavor.subEndeavors!.isEmpty) {
      return ListTile(
        title: Text(widget.endeavor.text!),
        selected: widget.endeavor.id == widget.selectedEndeavorId,
        onTap: () => _onSelected(),
      );
    } else {
      return ExpansionTile(
        title: GestureDetector(
          child: Text(
            widget.endeavor.text!,
          ),
          onTap: () => _onSelected(),
        ),
        textColor: widget.selectedEndeavorId == widget.endeavor.id
            ? Colors.blue
            : Colors.black,
        collapsedTextColor: widget.selectedEndeavorId == widget.endeavor.id
            ? Colors.blue
            : Colors.black,
        initiallyExpanded: widget.expandedIds.contains(widget.endeavor.id),
        controlAffinity: ListTileControlAffinity.leading,
        onExpansionChanged: (value) {
          widget.onExpansionChanged(widget.endeavor.id!, value);
        },
        children: widget.endeavor.subEndeavors!
            .map((e) => EndeavorSelectionTile(
                  endeavor: e,
                  selectedEndeavorId: widget.selectedEndeavorId,
                  expandedIds: widget.expandedIds,
                  onExpansionChanged: widget.onExpansionChanged,
                  onSelected: widget.onSelected,
                ))
            .toList(),
      );
    }
  }

  void _onSelected() {
    if (widget.selectedEndeavorId == widget.endeavor.id) {
      widget.onSelected(null);
    } else {
      widget.onSelected(widget.endeavor.id);
    }
  }
}
