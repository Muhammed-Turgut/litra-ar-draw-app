import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:litra_ar_draw_app/presentation/views/login/login_view.dart';
import 'package:litra_ar_draw_app/presentation/views/onBoarding/on_boarding_view.dart';
import 'package:litra_ar_draw_app/presentation/views/sigin/signin_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412,912),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            top: true,
            bottom: false,
            child: SignInView()
        ),
      ),
    );
  }
}

