import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litra_ar_draw_app/core/router/app_router.dart';
import 'package:litra_ar_draw_app/firebase_options.dart';
import 'package:litra_ar_draw_app/presentation/view_models/signin_view_model.dart';
import 'package:provider/provider.dart';

import 'data/repositories/FirebaseAuthRepository.dart';
import 'domain/usecase/register_user_use_case.dart';


void main() async {

  ///Uygulamanın sadece dikey moda kullanılmasını sağlamak için ekranı dikey moda kitledim.
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ///

  ///------------Fierbase------------
  /// 1. Gerekli bağlamayı sağlar (Firebase'den önce mutlaka olmalı)
  WidgetsFlutterBinding.ensureInitialized();

  /// 2. Firebase bağlantısını başlatır
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ///-----------------------

  final authRepository = FirebaseAuthRepository();
  ///Use casleri başlatığımız yer.
  final registerUserUseCase = RegisterUserUseCase(authRepository);

  runApp(
   MultiProvider(
     //Burda Providere widget ağacına enjecte etik.
     providers:[
        ChangeNotifierProvider(create: (_) => SigInViewModel(registerUserUseCase: registerUserUseCase))
      ],
     child:MyApp()
   ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}