import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/usecase/register_user_use_case.dart';


class SigInViewModel with ChangeNotifier {
  final RegisterUserUseCase registerUserUseCase;

  SigInViewModel({required this.registerUserUseCase});

  String? errorMessage;

  void setError(String message) {
    errorMessage = message;
    notifyListeners();

    Future.delayed(Duration(seconds: 3), () {
      errorMessage = null;
      notifyListeners();
    });
  }

  Future<void> register(String email, String password, String fullName, Function goRoute) async {
    try {
      await registerUserUseCase.execute(
        email: email,
        password: password,
        fullName: fullName,
      );
      errorMessage = null;
      goRoute();
    } catch (e) {
      setError(e.toString());
    }
  }


}