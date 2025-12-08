import 'package:firebase_auth/firebase_auth.dart';

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



}