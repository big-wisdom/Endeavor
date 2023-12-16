import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
// import 'package:cloud_functions/cloud_functions.dart';
import 'package:data_repository/data_repository.dart';
import 'package:data_service/data_service.dart';
import 'package:endeavor/firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:endeavor/app/app.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  DataService(authenticationRepository.user);
  final dataRepository =
      DataRepository(userStream: authenticationRepository.user);

  runApp(App(
    authenticationRepository: authenticationRepository,
    dataRepository: dataRepository,
  ));
}
