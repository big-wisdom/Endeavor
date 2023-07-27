import 'package:data_models/data_models.dart';
import 'package:server_data_models/server_data_models.dart';

extension EndeavorTransformers on Endeavor {
  static List<Endeavor> primaryEndeavors(
    UserDocument userDoc,
    List<ServerEndeavor> serverEndeavors,
    List<ServerTask> serverTasks,
  ) {
    // bin tasks
    Map<String, List<TaskReference>> idToTasks = {};
    for (final t in serverTasks) {
      if (t.endeavorId != null) {
        final ref = TaskReference(id: t.id, title: t.title);
        if (idToTasks[t.endeavorId] == null) {
          idToTasks[t.endeavorId!] = [ref];
        } else {
          idToTasks[t.endeavorId!]!.add(ref);
        }
      }
    }

    // bin server endeavors
    List<ServerEndeavor> primaryServerEndeavors = [];
    Map<String, List<EndeavorReference>> idToSubEndeavorReferences = {};
    for (final e in serverEndeavors) {
      if (e.parentEndeavorId == null) {
        primaryServerEndeavors.add(e);
      } else {
        final ref = EndeavorReference(title: e.title, id: e.id);
        if (idToSubEndeavorReferences[e.parentEndeavorId!] == null) {
          idToSubEndeavorReferences[e.parentEndeavorId!] = [ref];
        } else {
          idToSubEndeavorReferences[e.parentEndeavorId!]!.add(ref);
        }
      }
    }

    // Create primary endeavors
    List<Endeavor> primaryEndeavors = [];
    for (final e in primaryServerEndeavors) {
      primaryEndeavors.add(
        Endeavor(
          id: e.id,
          title: e.title,
          parentEndeavorId: e.parentEndeavorId,
          subEndeavorReferences: idToSubEndeavorReferences[e.id] ?? [],
          taskReferences: idToTasks[e.id] ?? [],
          color: e.color,
        ),
      );
    }

    // sort primary endeavors based on user document
    primaryEndeavors.sort((e1, e2) {
      final index1 = userDoc.primaryEndeavorIds.indexOf(e1.id);
      final index2 = userDoc.primaryEndeavorIds.indexOf(e2.id);

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
    return primaryEndeavors;
  }

  static Endeavor endeavorFromEndeavorsAndTasks(
    List<ServerEndeavor> serverEndeavors,
    List<ServerTask> serverTasks,
  ) {
    throw UnimplementedError();
  }
}
