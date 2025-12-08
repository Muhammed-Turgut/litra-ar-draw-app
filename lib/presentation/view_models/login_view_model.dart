import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:litra_ar_draw_app/core/errors/app_error.dart';
import 'package:litra_ar_draw_app/domain/usecase/login_user_use_case.dart';

class LoginViewModel with ChangeNotifier{

   final LoginUserUseCase loginUserUseCase;
   LoginViewModel({required this.loginUserUseCase});

   String? errorMessage;

   void setError(String message) {
     errorMessage = AppError().errorType(message);;
     notifyListeners();

     Future.delayed(Duration(seconds: 3), () {
       errorMessage = null;
       notifyListeners();
     });
   }

   Future<void> login(String email,String password, Function goRoute) async{
     try{

       await loginUserUseCase.login(
         email: email,
         password: password
       );
       errorMessage = null;
       goRoute();

     } on FirebaseAuthException catch(e){
       debugPrint("Sorun bulundu: ${e.code}");
        setError(e.code);
     }

   }

}