import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litra_ar_draw_app/presentation/views/login/login_view.dart';
import 'package:litra_ar_draw_app/presentation/widgets/profile/custom_input_field.dart';
import 'package:litra_ar_draw_app/presentation/widgets/profile/profile_button.dart';

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
              "assets/images/backgroun_materyal.svg", width: 412.w,
              height: 215.h,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412.w,
              height: 215.h,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412.w,
              height: 215.h,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412.w,
              height: 215.h,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412.w,
              height: 215.h,
              fit: BoxFit.cover,)),
            Expanded(child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg", width: 412.w,
              height: 215.h,
              fit: BoxFit.cover,)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20.h,),
            _buildTopFiled(),
            SizedBox(height: 28.h,),
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
        Image.asset("assets/images/app_logo.png", width: 128.w, height: 128.h),
        SizedBox(height: 16.h,),
        Text("Litra: AR Draw",
          style: TextStyle(
            fontSize: 36.sp,
            fontFamily: 'Outfit',
            height: 1.2.h,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Text("Welcome Back",
          style: TextStyle(
            fontSize: 28.sp,
            fontFamily: 'Outfit',
            height: 1.2.h,
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
                    "Login to your Account",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontFamily: 'Outfit',
                      height: 1.2.h,
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
                  SizedBox(height: 24.h),
                  ProfileButton(
                    title: "Log In",
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF50C4ED),
                    onPressButton: () {

                    },
                    widthButton: 380.w,
                  ),
                  SizedBox(height: 12.h),
                  ProfileButton(
                    title: "Continue as guest",
                    foregroundColor: Color(0xFFC8C8C8),
                    backgroundColor: Colors.white,
                    onPressButton: () {

                    },
                    widthButton: 380.w,
                    borderWidth: 1,
                  ),
                  SizedBox(height: 12.h,),
                  Text(
                      "Or continue with",
                      // Yazım hatasını düzelttim: Creat -> Create
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Outfit',
                        height: 1.2.h,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFC8C8C8),
                      )
                  ),
                  SizedBox(height: 18.h,),
                  SvgPicture.asset(
                    "assets/icons/google_icon.svg", width: 36.w, height: 36.h,),
                  SizedBox(height: 18.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Don’t have an account?",
                          // Yazım hatasını düzelttim: Creat -> Create
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Outfit',
                            height: 1.2.h,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFC8C8C8),
                          )
                      ),
                      SizedBox(width: 4,),

                      GestureDetector(
                        onTap: (){
                          _pageRoute(context);
                        },
                        child:  Text(
                            "Sig in", // Yazım hatasını düzelttim: Creat -> Create
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Outfit',
                              height: 1.2.h,
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
                topRight: Radius.circular(32.r), topLeft: Radius.circular(32.r))
        ),
      ),
    );
  }

  void _pageRoute(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }
}