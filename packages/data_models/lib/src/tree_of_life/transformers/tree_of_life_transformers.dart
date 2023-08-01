import 'package:data_models/data_models.dart';
import 'package:server_data_models/server_data_models.dart';

extension TreeOfLifeTransformers on TreeOfLife {
  static TreeOfLife fromIngredients(
    UserDocument? userDoc,
    List<ServerEndeavor> serverEndeavors,
    List<ServerTask> serverTasks,
  ) {
    // process the endeavors
    List<ServerEndeavor> primaryServerEndeavors = [];
    Map<String, List<ServerEndeavor>> endeavorIdToSubEndeavors = {};
    for (final e in serverEndeavors) {
      if (e.parentEndeavorId == null) {
        // grab the primary endeavors
        primaryServerEndeavors.add(e);
      } else {
        // map parents id to its subEndeavors ServerEndeavor object
        if (endeavorIdToSubEndeavors[e.id] == null) {
          endeavorIdToSubEndeavors[e.id] = [e];
        } else {
          endeavorIdToSubEndeavors[e.id]!.add(e);
        }
      }
    }

    // process the tasks
    Map<String, List<ServerTask>> endeavorIdToTasks = {};
    for (final t in serverTasks) {
      if (t.endeavorId != null) {
        if (endeavorIdToTasks[t.endeavorId] == null) {
          endeavorIdToTasks[t.endeavorId!] = [t];
        } else {
          endeavorIdToTasks[t.endeavorId!]!.add(t);
        }
      }
    }

    return _fromIngredientsHelper(
      primaryServerEndeavors,
      userDoc,
      endeavorIdToSubEndeavors,
      endeavorIdToTasks,
    );
  }

  static TreeOfLife activeTreeFromIngredients(
    UserDocument? userDoc,
    List<ServerEndeavor> serverEndeavors,
    List<ServerTask> serverTasks,
  ) {
    // process the tasks
    Map<String, List<ServerTask>> endeavorIdToTasks = {};
    Set<String> endeavorIdsToGrab = {};
    for (final t in serverTasks) {
      if (t.endeavorId != null) {
        endeavorIdsToGrab.add(t.endeavorId!);
        if (endeavorIdToTasks[t.endeavorId] == null) {
          endeavorIdToTasks[t.endeavorId!] = [t];
        } else {
          endeavorIdToTasks[t.endeavorId!]!.add(t);
        }
      }
    }

    List<ServerEndeavor> primaryServerEndeavors = [];
    Map<String, List<ServerEndeavor>> endeavorIdToSubEndeavors = {};
    Set<String> grabbedIds = {};
    while (endeavorIdsToGrab.isNotEmpty) {
      // go through all server endeavors
      for (final se in serverEndeavors) {
        // grab se if I'm looking for it and haven't already
        if (endeavorIdsToGrab.contains(se.id) && !grabbedIds.contains(se.id)) {
          if (se.parentEndeavorId != null) {
            // add to parents list if not primary
            if (endeavorIdToSubEndeavors[se.id] == null) {
              endeavorIdToSubEndeavors[se.id] = [se];
            } else {
              endeavorIdToSubEndeavors[se.id]!.add(se);
            }
            // add parent to endeavorIdsToGrab
            endeavorIdsToGrab.add(se.parentEndeavorId!);
          } else {
            // add primaries if primary
            primaryServerEndeavors.add(se);
          }

          grabbedIds.add(se.id);
          endeavorIdsToGrab.remove(se.id);
        }
      }
    }

    return _fromIngredientsHelper(
      primaryServerEndeavors,
      userDoc,
      endeavorIdToSubEndeavors,
      endeavorIdToTasks,
    );
  }

  static TreeOfLife _fromIngredientsHelper(
    List<ServerEndeavor> primaryServerEndeavors,
    UserDocument? userDoc,
    Map<String, List<ServerEndeavor>> endeavorIdToSubEndeavors,
    Map<String, List<ServerTask>> endeavorIdToTasks,
  ) {
    // process the primary endeavors
    List<EndeavorNode> primaryEndeavorNodes = primaryServerEndeavors
        .map<Endeavor>(
          (se) => Endeavor(
            id: se.id,
            title: se.title,
            subEndeavorReferences: endeavorIdToSubEndeavors[se.id]
                    ?.map((se) => EndeavorReference(title: se.title, id: se.id))
                    .toList() ??
                [],
            taskReferences: endeavorIdToTasks[se.id]
                    ?.map((st) => TaskReference(id: st.id, title: st.title))
                    .toList() ??
                [],
          ),
        )
        .map((e) => EndeavorNode(
              endeavor: e,
              subEndeavors: _recurseSubEndeavors(
                endeavorIdToSubEndeavors[e.id],
                endeavorIdToSubEndeavors,
                endeavorIdToTasks,
              ),
            ))
        .toList();

    // sort primary endeavors
    if (userDoc != null) {
      // reorder primaryEndeavorNodes
      primaryEndeavorNodes.sort((e1, e2) {
        final index1 = userDoc.primaryEndeavorIds.indexOf(e1.endeavor.id);
        final index2 = userDoc.primaryEndeavorIds.indexOf(e2.endeavor.id);

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
    }
    return TreeOfLife(primaryEndeavorNodes);
  }

  static List<EndeavorNode> _recurseSubEndeavors(
    List<ServerEndeavor>? currentSubEndeavors,
    Map<String, List<ServerEndeavor>> idToSubEndeavors,
    Map<String, List<ServerTask>> idToTasks,
  ) {
    if (currentSubEndeavors == null) return [];

    return currentSubEndeavors
        .map<Endeavor>(
          (se) => Endeavor(
            id: se.id,
            title: se.title,
            subEndeavorReferences: idToSubEndeavors[se.id]
                    ?.map<EndeavorReference>(
                      (subServerEndeavor) => EndeavorReference(
                        title: subServerEndeavor.title,
                        id: subServerEndeavor.id,
                      ),
                    )
                    .toList() ??
                [],
            taskReferences: idToTasks[se.id]
                    ?.map<TaskReference>(
                      (e) => TaskReference(
                        id: e.id,
                        title: e.title,
                      ),
                    )
                    .toList() ??
                [],
          ),
        )
        .map<EndeavorNode>(
          (e) => EndeavorNode(
            endeavor: e,
            subEndeavors: _recurseSubEndeavors(
              idToSubEndeavors[e.id],
              idToSubEndeavors,
              idToTasks,
            ),
          ),
        )
        .toList();
  }
}
