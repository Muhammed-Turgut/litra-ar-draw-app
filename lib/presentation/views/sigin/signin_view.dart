import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/views/login/login_view.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/custom_input_field.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/continue_button.dart';

class SignInView extends StatelessWidget {
  TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF50C4ED),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412,
              height: 215,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412,
              height: 215,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412,
              height: 215,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412,
              height: 215,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412,
              height: 215,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412,
              height: 215,
              fit: BoxFit.cover,)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20,),
            _buildTopFiled(),
            SizedBox(height: 28,),
            _buildTextFieldAre(context)
          ],
        )
      ],
    );
  }

  Widget _buildTopFiled() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/app_logo.png", width: 128, height: 128),
        SizedBox(height: 16,),
        Text("Litra: AR Draw",
          style: TextStyle(
            fontSize: 36,
            fontFamily: 'Outfit',
            height: 1.2,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Text("Welcome Back",
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'Outfit',
            height: 1.2,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildTextFieldAre(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 20, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Create your Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Outfit',
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF50C4ED),
                    ),
                  ),

                  SizedBox(height: 24),

                  CustomInputField(
                    title: "E-mail adress",
                    icon: "assets/icons/email_icon.svg",
                    hint: "example@gmail.com",
                    controller: _fullNameController,
                  ),
                  SizedBox(height: 16),
                  CustomInputField(
                    title: "Password",
                    icon: "assets/icons/lock_password_icon.svg",
                    hint: "**************",
                    controller: _fullNameController,
                  ),
                  SizedBox(height: 24),
                  ContinueButton(
                    title: "Sing Up",
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF50C4ED),
                    onPressButton: () {
                       context.go('/home');
                    },
                    widthButton: 380,
                  ),
                  SizedBox(height: 12),
                  ContinueButton(
                    title: "Continue as guest",
                    foregroundColor: Color(0xFFC8C8C8),
                    backgroundColor: Colors.white,
                    onPressButton: () {
                      context.go('/home');
                    },
                    widthButton: 380,
                    borderWidth: 1,
                  ),
                  SizedBox(height: 12,),
                  Text(
                      "Or continue with",
                      // Yazım hatasını düzelttim: Creat -> Create
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFC8C8C8),
                      )
                  ),
                  SizedBox(height: 18,),
                  SvgPicture.asset(
                    "assets/icons/google_icon.svg", width: 36, height: 36,),
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Do you have an account? ",
                          // Yazım hatasını düzelttim: Creat -> Create
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            height: 1.2,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFC8C8C8),
                          )
                      ),
                      SizedBox(width: 4,),

                      GestureDetector(
                        onTap: (){
                         context.go('/logIn');
                        },
                        child:  Text(
                            "Log in", // Yazım hatasını düzelttim: Creat -> Create
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF50C4ED),
                            )
                        )
                      )

                    ],
                  )

                ],
              ),
            )
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32))
        ),
      ),
    );
  }


}