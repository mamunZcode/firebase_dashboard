import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/dashboard/user_details_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_setup/login screen/login.dart';
import 'package:firebase_setup/dashboard/dashboard.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  // EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
      Navigator.pushNamed(context, login.id);
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      // showSnackBar(context, e.message!); // Displaying the usual firebase error message
    }
  }

  // EMAIL LOGIN
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!user.emailVerified) {
        await sendEmailVerification(context);
        // restrict access to certain things using provider
        // transition to another page instead of home screen
      }
      // Navigator.replace(context, HomeScreen.id);
      // replace navigator with home screen
      Navigator.replace(context,
          oldRoute: ModalRoute.of(context)!,
          newRoute: MaterialPageRoute(builder: (context) => UserDetailsForm()));
    } on FirebaseAuthException catch (e) {
      print('failed ' + e.toString());
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      // showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      // showSnackBar(context, e.message!); // Display error message
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushNamed(context, login.id);
    } on FirebaseAuthException catch (e) {
      // showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      // showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}
