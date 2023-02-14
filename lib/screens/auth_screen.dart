import 'package:endeavor/widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential userCredential;

    try {
      setState(() {
        isLoading = true;
      });

      if (isLogin) {
        // log user in
        userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        // create new user
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
            'username': username,
            'email': email,
          })
          .then((value) => debugPrint("User Added"))
          .catchError((error) => debugPrint("Faild to add user: $error"));
    } on PlatformException catch (err) {
      var message = "An error occured, please check your credentials";

      if (err.message != null) {
        message = err.message!;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Failed: $message")));
      setState(() {
        isLoading = false;
      });
    } catch (err) {
      // ignore: avoid_print
      print(err);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(_submitAuthForm, isLoading),
    );
  }
}
