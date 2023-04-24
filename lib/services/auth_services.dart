import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/snackbar.dart';
import 'package:flutter_application_1/responsive/responsive.dart';
import 'package:flutter_application_1/views/mobile/features/features.dart';
import 'package:flutter_application_1/views/web/features/features.dart';

class AuthServices {
  const AuthServices(this._auth);
  final FirebaseAuth _auth;

  Stream<User?> get authStateChange => _auth.idTokenChanges();

  Future<User?> createNewAccoutWithEmailAndPassword(
      String email, String password, context) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      customSnackBar(context, 'Yup!', 'New Account Created Successfully',
          ContentType.success);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const Responsive(
                    web: WebLandingPage(),
                    mobile: MobileLandingPage(),
                  )));
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        customSnackBar(context, 'Oh snap!',
            'User already exits with this email', ContentType.failure);
      }
      if (e.code == 'weak-password') {
        customSnackBar(context, 'Oh snap!',
            'Password should be at least 6 characters', ContentType.failure);
      } else {
        customSnackBar(
            context,
            'Warning!',
            'Sorry! something went wrong.Please try again.',
            ContentType.warning);
      }
    }
    return null;
  }

  Future<User?> signWithEmailAndPassword(
      String email, String password, context) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      customSnackBar(
          context, 'Yup!', 'Your are login successfull.', ContentType.success);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const Responsive(
                    web: WebLandingPage(),
                    mobile: MobileLandingPage(),
                  )));
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customSnackBar(
            context, 'Oh snap!', 'User not found', ContentType.failure);
      }
      if (e.code == 'wrong-password') {
        customSnackBar(context, 'Oh snap!', 'Incorroct Password, Check again.',
            ContentType.failure);
      } else {
        customSnackBar(
            context,
            'Warning!',
            'Sorry! something went wrong.Please try again.',
            ContentType.warning);
      }
    }
    return null;
  }

  Future<void> signOut(context) async {
    await _auth.signOut();
    customSnackBar(context, 'Yup!', 'You are logged out successfull.',
        ContentType.success);
  }

  Future<void> delete(context) async {
    await _auth.currentUser!.delete();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => const Responsive(
                web: WebLandingPage(), mobile: MobileLandingPage())));
    customSnackBar(
        context, 'Yup!', 'Accound deleted  successfull.', ContentType.success);
  }
}
