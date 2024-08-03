import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

class TreeOfLife extends Equatable {
  const TreeOfLife(this.primaryEndeavorNodes);

  static TreeOfLife fromEndeavorsList(List<Endeavor> endeavors) {
    // create map of id to children
    Map<int, List<Endeavor>> childMap = {};
    // add each to its parent
    endeavors.forEach((e) => childMap[e.parentEndeavorId]?.add(e));

    // for each primary add children recursively
    return TreeOfLife(
      endeavors
          .where((e) => e.parentEndeavorId == null || e.parentEndeavorId == 0)
          .map((e) => recurseAddChildren(
                EndeavorNode(endeavor: e, subEndeavors: []),
                childMap,
              ))
          .toList(),
    );
  }

  // takes in an endeavor node that has an endeavor in it but not the subendeavors yet.
  // Then it uses the map to recursively add children to it.
  static EndeavorNode recurseAddChildren(
    EndeavorNode current,
    Map<int, List<Endeavor>> childMap,
  ) {
    childMap[current.endeavor.id]?.forEach(
      (child) => current.subEndeavors.add(
        recurseAddChildren(
          EndeavorNode(
            endeavor: child,
            subEndeavors: [],
          ),
          childMap,
        ),
      ),
    );
    return current;
  }

  final List<EndeavorNode> primaryEndeavorNodes;

  @override
  List<Object?> get props => [primaryEndeavorNodes];
}
