import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:endeavor/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:endeavor/app/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8081);
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  CachedQuery.instance.configFlutter(
    config: QueryConfigFlutter(
      refetchOnConnection: true,
      refetchOnResume: true,
      ignoreCacheDuration: true,
    ),
  );

  runApp(App(
    authenticationRepository: authenticationRepository,
  ));
}
