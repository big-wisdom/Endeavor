import 'dart:ui';

import 'package:equatable/equatable.dart';

class EndeavorSettings extends Equatable {
  const EndeavorSettings({this.color, this.id});

  Map<String, dynamic> toData() {
    if (this != empty) {
      return {'color': color!.value.toRadixString(16)};
    } else {
      throw Exception("Can't convert empty settings to data");
    }
  }

  EndeavorSettings.fromDocSnapData(
      {this.id, required Map<String, dynamic> data})
      : color = data['color'] != null
            ? Color(int.parse("0xFF${data['color']}"))
            : null;

  final Color? color;
  final String? id;

  static const empty = EndeavorSettings();

  EndeavorSettings copyWith(Color newColor) {
    return EndeavorSettings(
      color: newColor,
      id: id,
    );
  }

  bool get isEmpty {
    return this == empty;
  }

  bool get isNotEmpty {
    return this != empty;
  }

  @override
  List<Object?> get props => [color, id];
}
