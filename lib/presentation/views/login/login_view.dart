import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/view_models/login_view_model.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/custom_input_field.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/continue_button.dart';
import 'package:provider/provider.dart';


class LoginView extends StatelessWidget {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String email ="",password ="";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF50C4ED),
      body: SafeArea(
          top: true,
          bottom: true,
          child: _buildBody(context)),
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
        ),

        Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage == null) return SizedBox();
            return Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // PROGRESS BAR (3 saniye)
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    duration: Duration(seconds: 3),
                    builder: (context, value, _) {
                      return LinearProgressIndicator(
                        value: value,
                        backgroundColor: Color(0xFF50C4ED).withOpacity(0.3),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF50C4ED)),
                      );
                    },
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF50C4ED),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            viewModel.errorMessage!,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Outfit',
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
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
            height: 1.0,
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
                    "Login to your Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Outfit',
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF50C4ED),
                    ),
                  ),

                  SizedBox(height: 24),
                  Form(
                    key: _formKey,
                      child: _buildTextField()
                  ),
                  SizedBox(height: 16),
                  ContinueButton(
                    title: "Log in",
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF50C4ED),
                    onPressButton: () {
                      final viewModel = Provider.of<LoginViewModel>(context, listen: false);

                      if(_formKey.currentState!.validate()){
                        email = _emailController.text;
                        password = _passwordController.text;
                      }
                      viewModel.login(email,password,(){
                        context.go('/home');
                       }
                      );
                    },
                    widthButton: 380,
                  ),
                  SizedBox(height: 8),
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
                  SizedBox(height: 24,),
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
                  SizedBox(height: 16,),
                  SvgPicture.asset(
                    "assets/icons/google_icon.svg", width: 36, height: 36,),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Don’t have an account? ",
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
                          context.go('/signUp');
                        },
                        child:  Text(
                            "Sign in", // Yazım hatasını düzelttim: Creat -> Create
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF50C4ED),
                            )
                        ),
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

  Widget _buildTextField() {
   return Consumer<LoginViewModel>(builder: (context,viewModel,child){
      return  Column(
        children: [
          CustomInputField(
            title: "E-mail adress",
            icon: "assets/icons/email_icon.svg",
            hint: "example@gmail.com",
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              }
              if (!value.contains("@gmail.com") && value.length >= 11) {
                return "Invalid email format";
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomInputField(
              title: "Password",
              icon: "assets/icons/lock_password_icon.svg",
              hint: "**************",
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your password';
                }
                if (value.length < 8) {
                  return 'Your password must be at least 8 characters.';
                }
                return null;
              }
          ),
          SizedBox(height: 4,),
          GestureDetector(
            onTap:(){
              context.go('/forgetPassword');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("forget password",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF969696),
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline
                  ),
                )
              ],
            ),
          )

        ],
      );
     }
    );

  }

}