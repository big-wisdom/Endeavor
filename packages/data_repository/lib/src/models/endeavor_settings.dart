import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';

class EndeavorSettings extends Equatable {
  const EndeavorSettings({this.title, this.color, this.id});

  Map<String, dynamic> toData() {
    if (this != empty) {
      return {
        'title': title,
        'color': color!.value.toRadixString(16),
      };
    } else {
      throw Exception("Can't convert empty settings to data");
    }
  }

  EndeavorSettings.fromDocSnapData(
      {this.id, required Map<String, dynamic> data})
      : color = data['color'] != null
            ? Color(int.parse("0xFF${data['color']}"))
            : null,
        title = data['title'];

  final Color? color;
  final String? id;
  final String? title;

  static const empty = EndeavorSettings();

  EndeavorSettings copyWith({Color? newColor, String? newTitle}) {
    return EndeavorSettings(
      color: newColor ?? color,
      id: id,
      title: newTitle ?? title,
    );
  }

  static final transformListToMap = StreamTransformer<List<EndeavorSettings>,
      Map<String, EndeavorSettings>>.fromHandlers(
    handleData: ((data, sink) {
      sink.add(
        Map.fromIterable(
          data,
          key: ((e) => e.id!),
          value: ((e) => e),
        ),
      );
    }),
  );

  bool get isEmpty {
    return this == empty;
  }

  bool get isNotEmpty {
    return this != empty;
  }

  @override
  List<Object?> get props => [color, id];
}
