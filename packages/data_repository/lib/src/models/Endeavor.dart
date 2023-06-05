import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class Endeavor extends Equatable {
  const Endeavor({
    required this.id,
    this.title,
    this.subEndeavorIds,
    this.settings,
  });

  Map<String, dynamic> toData() {
    return {
      'text': title,
      'subEndeavorIds': subEndeavorIds,
    };
  }

  Endeavor.fromDocData({required String id, required Map<String, dynamic> data})
      : id = id,
        title = data['text'],
        settings = null,
        subEndeavorIds = data['subEndeavorIds'] == null
            ? null
            : (data['subEndeavorIds'] as List)
                .map((id) => id as String)
                .toList();

  final String? title;
  final String id;
  final List<String>? subEndeavorIds;
  final EndeavorSettings? settings;

  Endeavor copyWith({
    String? title,
    List<String>? subEndeavorIds,
    EndeavorSettings? settings,
  }) {
    return Endeavor(
      id: id,
      title: title ?? this.title,
      subEndeavorIds: subEndeavorIds ?? this.subEndeavorIds,
      settings: settings ?? this.settings,
    );
  }

  static const empty = Endeavor(id: '');

  bool get isEmpty => this == Endeavor.empty;

  bool get isNotEmpty => this != Endeavor.empty;

  @override
  List<Object?> get props => [id];
}
