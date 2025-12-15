import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/views/camera/camera_view.dart';
import 'package:litra_ar_draw_app/presentation/views/choose_draw_type/choose_draw_type.dart';
import 'package:litra_ar_draw_app/presentation/views/forget_password/forget_password_view.dart';
import 'package:litra_ar_draw_app/presentation/views/home/home_view.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/detail_bottom_bar.dart';
import 'package:litra_ar_draw_app/presentation/views/level/level_view.dart';
import 'package:litra_ar_draw_app/presentation/views/login/login_view.dart';
import 'package:litra_ar_draw_app/presentation/views/noInternet/no_internet_view.dart';
import 'package:litra_ar_draw_app/presentation/views/onBoarding/on_boarding_view.dart';
import 'package:litra_ar_draw_app/presentation/views/share_page/share_page_view.dart';
import 'package:litra_ar_draw_app/presentation/views/sigin/signin_view.dart';
import 'package:litra_ar_draw_app/presentation/views/splash/splash_view.dart';

class AppRouter{
  AppRouter._();

  ///Flutter’da yönlendirmeyi (navigation) widget tree'nin dışından yapabilmek için kullanılan bir yapıdır.
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/splash',
    routes: [

      GoRoute(
        //Splash screen - ilk açılan ekranım
        path: '/splash',
        name: 'splash',
        builder: (context,state) => SplashView()
      ),

      GoRoute(
        //OnBoarding screen - Uygulama tanıtım ekranı.
          path: '/onBoarding',
          name: 'onBoarding',
          builder: (context,state) => OnBoardingView()
      ),

      GoRoute(
        //SignIn Screen - Kullanıcının kayıt olduğu yer.
          path: '/signUp',
          name: 'signUp',
          builder: (context,state) => SignInView()
      ),

      GoRoute(
        //LogIn Screen - Kullanıcının mevcut hesabı ile giriş yaptığı yer.
          path: '/logIn',
          name: 'logIn',
          builder: (context,state) => LoginView()
      ),

      GoRoute(
        //Home Screen - Ana Sayfa
          path: '/home',
          name: 'home',
          builder: (context,state) => HomeView()
      ),

      GoRoute(
        //Home Screen - Ana Sayfa
          path: '/home/detailBottomBar',
          name: 'home-detailBottomBar',
          builder: (context,state) => DetailBottomBar()
      ),

      GoRoute(
        //Home Screen - Ana Sayfa
          path: '/home/levelView',
          name: 'home-levelView',
          builder: (context,state) => LevelView()
      ),

      GoRoute(
        //Home Screen - Ana Sayfa
          path: '/home/chooseDrawType',
          name: 'home-chooseDrawType',
          builder: (context,state) => ChooseDrawType()
      ),

      GoRoute(
        //Home Screen - Ana Sayfa
          path: '/home/chooseDrawType/cameraView',
          name: 'home-chooseDrawType-cameraView',
          builder: (context,state) => CameraView()
      ),

      GoRoute(
            //Home Screen - Ana Sayfa
            path: '/home/sharePost',
            name: 'home-sharePost',
            builder: (context,state) => SharePageView()
      ),

      //NoInternetView - internet olmaması durumunda gösterilecek ekran.
      GoRoute(
        //Home Screen - Ana Sayfa
          path: '/noInternet',
          name: 'noInternet',
          builder: (context,state) => NoInternetView()
      ),

      GoRoute(
        //Kullanıcı şifresini unutmuşsa burdan gidicek ve şifresini sıfırlayacak.
          path: '/forgetPassword',
          name: 'forgetPassword',
          builder: (context,state) => ForgetPasswordView()
      )


    ]

  );

}