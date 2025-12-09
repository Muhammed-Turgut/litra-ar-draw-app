
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:litra_ar_draw_app/domain/repositories/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;



  @override
  Future<UserCredential> registerUser({
    required String email,
    required String password,
    required String fullName,
  }) async {

    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore.collection("users").doc(userCredential.user!.uid).set({
      "fullName": fullName,
      "email": email,
      "uid": userCredential.user!.uid,
      "createdAt": DateTime.now(),
    });

    await userCredential.user!.sendEmailVerification(); //Kullanıcıya mail gönderdik e postayı doğrulaması için

    return userCredential;
  }

  @override
  Future<void> loginUser({required String email, required String password}) async {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> resetPassword({required String email}) async{
     await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signInWithGoogle({required BuildContext context}) async {





  }



  @override
  Future<void> withGoogleSignUp({required String fullName, required String email, required String uid}) async{}



}