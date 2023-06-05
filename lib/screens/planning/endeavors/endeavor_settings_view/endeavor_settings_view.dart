import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EndeavorSettingsView extends StatefulWidget {
  const EndeavorSettingsView({
    required this.uid,
    required this.endeavorId,
    required this.settingsMap,
    super.key,
  });

  final String uid;
  final String endeavorId;
  final Map<String, dynamic>? settingsMap;

  @override
  State<EndeavorSettingsView> createState() => _EndeavorSettingsViewState();
}

class _EndeavorSettingsViewState extends State<EndeavorSettingsView> {
  late Color pickerColor;

  @override
  void initState() {
    Color defaultColor = const Color(0xFF007AFF);
    if (widget.settingsMap != null && widget.settingsMap!['color'] != null) {
      pickerColor = Color(int.parse("0xFF${widget.settingsMap!['color']}"));
    } else {
      pickerColor = defaultColor;
    }
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
                    launchColorPicker();
                  },
                ),
                Container(
                  color: pickerColor,
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

  void launchColorPicker() {
    showDialog(
      context: context,
      builder: (context) {
        // create some values
        Color currentColor = pickerColor;
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                // update this in the endeavor doc
                final docRef = FirebaseFirestore.instance
                    .collection("users")
                    .doc(widget.uid)
                    .collection("endeavors")
                    .doc(widget.endeavorId);
                docRef.get().then((docSnap) {
                  final data = docSnap.data();
                  if (docSnap.exists && data != null) {
                    docRef.update({
                      "settings": {"color": pickerColor.value.toRadixString(16)}
                    });
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
}
