import 'dart:async';
import 'package:coding_challenge/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRepository {
  Future<void> logInWithGoogle();

  Future<void> logInWithFacebook();

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

@LazySingleton(as: LoginRepository)
class ImpLoginRepository implements LoginRepository {
  ImpLoginRepository(
    this._firebaseAuth,
    this._googleSignIn,
    this._facebookAuth,
  );

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  @override
  Future<void> logInWithGoogle() async {
    try {
      late final AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<void> logInWithFacebook() async {
    try {
      late final AuthCredential credential;

      final facebookUser = await _facebookAuth.login();

      credential =
          FacebookAuthProvider.credential(facebookUser.accessToken!.token);
      await _firebaseAuth.signInWithCredential(credential);
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw ServerException();
    }
  }
}
