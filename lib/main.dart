import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litra_ar_draw_app/core/router/app_router.dart';
import 'package:litra_ar_draw_app/firebase_options.dart';
import 'package:litra_ar_draw_app/presentation/providers/camera_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/category_item_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/explore_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/login_providers.dart';
import 'package:provider/provider.dart';

List<CameraDescription> cameras = [];

void main() async {

  ///Uygulamanın sadece dikey moda kullanılmasını sağlamak için ekranı dikey moda kitledim.
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ///---------------------------------------



  /// 2. Firebase bağlantısını başlatır !!! şimdilik kalıcak
  ///
  ///------------Fierbase------------
  /// 1. Gerekli bağlamayı sağlar (Firebase'den önce mutlaka olmalı)
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
   MultiProvider(
     //Burda Providere widget ağacına enjecte etik.
     providers:[
       ...loginProviders,
       ...cameraProviders,
       ...exploreProviders,
       ...mainProviders
     ],
     child:MyApp()
   ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}