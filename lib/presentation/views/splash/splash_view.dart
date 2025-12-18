import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});


  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode((SystemUiMode.immersive));

    FirebaseAuth.instance.authStateChanges().listen((User? user){

      if(user == null){
        context.go('/onBoarding');
      }
      else{
        Future.delayed(const Duration(seconds: 3),(){
          context.go('/home');
        }
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF50C4ED),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("assets/images/backgroun_materyal.svg",fit: BoxFit.contain),
            SvgPicture.asset("assets/images/backgroun_materyal.svg",fit: BoxFit.contain),
            SvgPicture.asset("assets/images/backgroun_materyal.svg",fit: BoxFit.contain),
            SvgPicture.asset("assets/images/backgroun_materyal.svg",fit: BoxFit.contain),
            SvgPicture.asset("assets/images/backgroun_materyal.svg",fit: BoxFit.contain),
            SvgPicture.asset("assets/images/backgroun_materyal.svg",fit: BoxFit.contain),
           ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 200.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/app_logo.png", width: 180, height: 180,),
                SizedBox(height: 24),
                Text("Litra: AR Draw",
                 style: TextStyle(
                   color: Colors.white,
                   fontFamily: 'Outfit',
                   fontSize: 32,
                   height: 1.2,
                   fontWeight: FontWeight.w700
                 ),
                ),

                Text("Art at your fingertips",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Outfit',
                      fontSize: 16,
                      height: 1.1,
                      fontWeight: FontWeight.w300
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
