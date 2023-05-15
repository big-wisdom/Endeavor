import 'package:equatable/equatable.dart';

class Endeavor extends Equatable {
  Endeavor.fromDocData({required String id, required Map<String, dynamic> data})
      : id = id,
        title = data['text'],
        subEndeavorIds = data['subEndeavorIds'] == null
            ? null
            : (data['subEndeavorIds'] as List)
                .map((id) => id as String)
                .toList();

  final String title;
  final String id;
  final List<String>? subEndeavorIds;

  @override
  List<Object?> get props => [id];
}
