import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:litra_ar_draw_app/core/errors/app_error.dart';
import 'package:litra_ar_draw_app/domain/usecase/register_user_use_case.dart';

class SigInViewModel with ChangeNotifier {
  final RegisterUserUseCase registerUserUseCase;

  SigInViewModel({required this.registerUserUseCase});

  String? errorMessage;

  void setError(String message) {
    errorMessage = AppError().errorType(message);
    notifyListeners();

    Future.delayed(Duration(seconds: 3), () {
      errorMessage = null;
      notifyListeners();
    });
  }

  Future<void> register(String email, String password, String fullName, Function function) async {
    try {
      await registerUserUseCase.register(
        email: email,
        password: password,
        fullName: fullName,
      );
      errorMessage = null;
      function();
    } on FirebaseAuthException catch(e){
      debugPrint("sorun bulundu: $e");
      setError(e.code);
    }
  }


}