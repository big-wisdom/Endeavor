import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class Endeavor extends Equatable {
  const Endeavor({
    this.id,
    this.parentEndeavorId,
    this.title,
    this.subEndeavorIds,
    this.subEndeavors,
    this.settings,
    this.taskIds,
    this.tasks,
  });

  Map<String, dynamic> toData() {
    return {
      'text': title,
      'subEndeavorIds': subEndeavorIds,
      'parentEndeavorId': parentEndeavorId,
      'taskIds': taskIds,
    };
  }

  Endeavor.fromDocData({required String id, required Map<String, dynamic> data})
      : id = id,
        subEndeavors = null,
        parentEndeavorId = data['parentEndeavorId'],
        title = data['text'],
        settings = null,
        taskIds = data['taskIds'] != null
            ? (data['taskIds'] as List).map((e) => e as String).toList()
            : null,
        tasks = null,
        subEndeavorIds = data['subEndeavorIds'] == null
            ? null
            : (data['subEndeavorIds'] as List)
                .map((id) => id as String)
                .toList();

  final String? title;
  final String? id;
  final String? parentEndeavorId;
  final List<String>? subEndeavorIds;
  final List<Endeavor>? subEndeavors;
  final EndeavorSettings? settings;
  final List<String>? taskIds;
  final List<Task>? tasks;

  Endeavor copyWith({
    String? title,
    List<String>? subEndeavorIds,
    List<Endeavor>? subEndeavors,
    EndeavorSettings? settings,
    List<Task>? tasks,
  }) {
    return Endeavor(
      id: id,
      title: title ?? this.title,
      subEndeavorIds: subEndeavorIds ?? this.subEndeavorIds,
      subEndeavors: subEndeavors ?? this.subEndeavors,
      settings: settings ?? this.settings,
      tasks: tasks ?? this.tasks,
    );
  }

  static const empty = Endeavor(id: '');

  bool get isEmpty => this == Endeavor.empty;

  bool get isNotEmpty => this != Endeavor.empty;

  @override
  List<Object?> get props => [id];
}
