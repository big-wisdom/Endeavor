import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

class TreeOfLife extends Equatable {
  const TreeOfLife._(this.primaryEndeavorNodes);

  factory TreeOfLife.fromEndeavorsList(
    List<String> orderedPrimaryEndeavorIds,
    List<Endeavor> endeavorList,
  ) {
    // pick out primary endeavors and link others to a parent
    final Map<String, List<Endeavor>> parentEndeavorIdToEndeavorList = {};
    final List<Endeavor> primaryEndeavors = [];
    for (final e in endeavorList) {
      if (e.parentEndeavorId == null) {
        primaryEndeavors.add(e);
      } else {
        if (parentEndeavorIdToEndeavorList[e.parentEndeavorId!] == null) {
          parentEndeavorIdToEndeavorList[e.parentEndeavorId!] = [e];
        } else {
          parentEndeavorIdToEndeavorList[e.parentEndeavorId!]!.add(e);
        }
      }
    }

    // build tree of life
    List<EndeavorNode> primaryEndeavorNodes = [];
    for (final e in primaryEndeavors) {
      primaryEndeavorNodes.add(
        EndeavorNode(
          endeavor: e,
          subEndeavors: _recurseBuildTree(parentEndeavorIdToEndeavorList[e.id],
              parentEndeavorIdToEndeavorList),
        ),
      );
    }

    // reorder primaryEndeavorNodes
    primaryEndeavorNodes.sort((e1, e2) {
      final index1 = orderedPrimaryEndeavorIds.indexOf(e1.endeavor.id);
      final index2 = orderedPrimaryEndeavorIds.indexOf(e2.endeavor.id);

      if (index1 == -1 && index2 == -1) {
        return 0;
      } else if (index1 == -1) {
        return 1;
      } else if (index2 == -1) {
        return -1;
      } else {
        return index1.compareTo(index2);
      }
    });

    return TreeOfLife._(primaryEndeavorNodes);
  }

  static List<EndeavorNode> _recurseBuildTree(
    List<Endeavor>? currentGroupOfSubEndeavors,
    Map<String, List<Endeavor>> parentEndeavorIdToEndeavorList,
  ) {
    if (currentGroupOfSubEndeavors == null) return [];
    return currentGroupOfSubEndeavors
        .map(
          (e) => EndeavorNode(
            endeavor: e,
            subEndeavors: _recurseBuildTree(
              parentEndeavorIdToEndeavorList[e.id],
              parentEndeavorIdToEndeavorList,
            ),
          ),
        )
        .toList();
  }

  final List<EndeavorNode> primaryEndeavorNodes;

  @override
  List<Object?> get props => [primaryEndeavorNodes];
}
