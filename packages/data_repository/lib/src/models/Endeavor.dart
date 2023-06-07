import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class Endeavor extends Equatable {
  const Endeavor({
    this.id,
    this.title,
    this.subEndeavorIds,
    this.settings,
    this.taskIds,
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
        taskIds = data['taskIds'] != null
            ? (data['taskIds'] as List).map((e) => e as String).toList()
            : null,
        subEndeavorIds = data['subEndeavorIds'] == null
            ? null
            : (data['subEndeavorIds'] as List)
                .map((id) => id as String)
                .toList();

  final String? title;
  final String? id;
  final List<String>? subEndeavorIds;
  final EndeavorSettings? settings;
  final List<String>? taskIds;

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
