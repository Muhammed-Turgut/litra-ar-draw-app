import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litra_ar_draw_app/core/router/app_router.dart';


void main() async {

  ///Uygulamanın sadece dikey moda kullanılmasını sağlamak için ekranı dikey moda kitledim.
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ///

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}