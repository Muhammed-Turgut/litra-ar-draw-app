import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthRepository{

  Future<UserCredential> registerUser({
    required String email,
    required String password,
    required String fullName,
  });

  Future<void> loginUser({
    required String email,
    required String password,
  });

  Future<void> resetPassword({required String email});

  Future<void> withGoogleSignUp({
    required String fullName,
    required String email,
    required String uid,
  });

  Future<void> signInWithGoogle({ required BuildContext context});


}