import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription authStream;
  User? currentUser;
  bool working = false;
  FirebaseAuthException? error;

  AuthController() {
    authStream = _auth.authStateChanges().listen(handleAuthUserChanges);
  }

  @override
  dispose() {
    authStream.cancel();
    super.dispose();
  }

  handleAuthUserChanges(User? event) {
    if (event == null) {
      print('No Logged In Users');
    }
    if (event != null) {
      print('Logged In User');
      print(event?.email);
    }
    currentUser = event;
    notifyListeners();
  }

  Future login(String email, String password) async {
    try {
      working = true; //telling the app that controller is working
      notifyListeners(); // tell changes controller
      UserCredential? result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      working = false;
      notifyListeners();
      return result;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
      currentUser = null;
      error = e;
      notifyListeners();
    }
  }

  Future logout() async {
    working = true;
    notifyListeners();
    await _auth.signOut();
    working = false;
    notifyListeners();
    return;
  }
}
