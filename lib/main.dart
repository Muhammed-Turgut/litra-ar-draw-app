import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:litra_ar_draw_app/core/router/app_router.dart';
import 'package:litra_ar_draw_app/firebase_options.dart';
import 'package:litra_ar_draw_app/presentation/providers/camera_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/category_item_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/explore_providers.dart';
import 'package:litra_ar_draw_app/presentation/providers/login_providers.dart';
import 'package:provider/provider.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // sadece bir kere yeterli

  cameras = await availableCameras(); // ← bunu ekle

  await MobileAds.instance.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ...loginProviders,
        ...cameraProviders,
        ...exploreProviders,
        ...mainProviders,
      ],
      child: MyApp(),
    ),
  );
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