import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:litra_ar_draw_app/domain/repositories/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
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

    await userCredential.user!.sendEmailVerification();
    return userCredential;
  }

  @override
  Future<void> loginUser({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      // 7.2.0'da initialize() await edilmeli
      // ÖNEMLİ: serverClientId Firebase konsolundan Web Client ID olmalı (idToken için gerekli)
      await _googleSignIn.initialize(
        clientId: "160471363498-9p88c0g874rpe1ljh3u3a2sfj8is1dtm.apps.googleusercontent.com",
        serverClientId: "160471363498-9p88c0g874rpe1ljh3u3a2sfj8is1dtm.apps.googleusercontent.com", // Web Client ID
      );

      // Önce sessiz girişi dene (eğer kullanıcı daha önce giriş yaptıysa)
      GoogleSignInAccount? account = await _googleSignIn.attemptLightweightAuthentication();
      
      // Eğer sessiz giriş başarısız olursa, authenticate() kullan (7.2.0'da signIn() yok!)
      account ??= await _googleSignIn.authenticate();

      if (account == null) {
        throw FirebaseAuthException(
          code: 'SIGN_IN_ABORTED_BY_USER',
          message: "Kullanıcı girişi iptal etti",
        );
      }

      // authentication artık direkt await edilebilir
      final GoogleSignInAuthentication googleAuth = await account.authentication;

      if (googleAuth.idToken == null) {
        throw FirebaseAuthException(
          code: 'NO_ID_TOKEN',
          message: "Google ID token alınamadı. serverClientId doğru mu?",
        );
      }

      // Firebase için sadece idToken yeterli, accessToken opsiyonel
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
       // accessToken: googleAuth.accessToken, // null olabilir, sorun değil
      );

      return await _auth.signInWithCredential(credential);
      
    } on GoogleSignInException catch (e) {
      // GoogleSignInException'ı yakala ve FirebaseAuthException'a çevir
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw FirebaseAuthException(
          code: 'SIGN_IN_ABORTED_BY_USER',
          message: "Google girişi iptal edildi: ${e.toString()}",
        );
      } else {
        throw FirebaseAuthException(
          code: 'GOOGLE_SIGN_IN_FAILED',
          message: "Google girişi başarısız: ${e.toString()}",
        );
      }
      rethrow;
    } on FirebaseAuthException {
      // FirebaseAuthException'ı olduğu gibi fırlat
      rethrow;
    } catch (e) {
      // Diğer hatalar
      throw FirebaseAuthException(
        code: 'UNKNOWN_ERROR',
        message: "Beklenmeyen hata: ${e.toString()}",
      );

      rethrow;
    }
  }

}