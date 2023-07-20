import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EndeavorSettingsScreenView extends StatelessWidget {
  const EndeavorSettingsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<EditEndeavorScreenBloc>().state
        as LoadedEditEndeavorScreenState;
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
                    launchColorPicker(context, state.color);
                  },
                ),
                Container(
                  color: state.color,
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
        // create some values
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: color ?? Theme.of(context).primaryColor,
              onColorChanged: (newColor) => context
                  .read<EditEndeavorScreenBloc>()
                  .add(ColorChanged(newColor)),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
