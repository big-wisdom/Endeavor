// import 'package:data_models/data_models.dart';
// import 'package:data_repository/data_repository.dart';
// import 'dart:async';

// import 'package:rxdart/rxdart.dart';
// // import 'package:rxdart/rxdart.dart';

// extension TasksData on DataRepository {
//   Stream<(TreeOfLife, List<Task>)> tasksScreenStream() {
//     return CombineLatestStream.combine2(
//       treeOfLifeStream(),
//       tasksWithNoEndeavorStream(),
//       (a, b) => (a, b),
//     );
//   }

//   Stream<List<Task>> tasksWithNoEndeavorStream() {
//     if (firestore == null) throw Exception("No user!");

//     return firestore!
//         .collection('tasks')
//         .snapshots()
//         .transform<List<Task>>(TaskFirestoreExtension.taskListTransformer);
//   }
// }
