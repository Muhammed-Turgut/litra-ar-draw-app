import 'package:flutter/material.dart';
import 'package:litra_ar_draw_app/presentation/views/splash/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
      top: true,
      bottom: false,
      child: SplashView(),
    ),

    );
  }
}

