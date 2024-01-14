import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EndeavorSettingsScreenView extends StatefulWidget {
  final Color selectedColor;
  final void Function(Color) onChanged;
  const EndeavorSettingsScreenView(
      {super.key, required this.onChanged, required this.selectedColor});

  @override
  State<EndeavorSettingsScreenView> createState() =>
      _EndeavorSettingsScreenViewState();
}

class _EndeavorSettingsScreenViewState
    extends State<EndeavorSettingsScreenView> {
  late Color selectedColor;
  @override
  void initState() {
    selectedColor = widget.selectedColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Color"),
                TextButton(
                  child: const Text("Choose Color"),
                  onPressed: () {
                    launchColorPicker(context, selectedColor);
                  },
                ),
                Container(
                  color: selectedColor,
                  width: 100,
                  height: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void launchColorPicker(BuildContext context, Color? color) {
    showDialog(
      context: context,
      builder: (context) {
        Color selectedColor = color ?? Theme.of(context).primaryColor;
        // create some values
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (newColor) => selectedColor = newColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() {
                  this.selectedColor = selectedColor;
                });
                widget.onChanged(selectedColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
