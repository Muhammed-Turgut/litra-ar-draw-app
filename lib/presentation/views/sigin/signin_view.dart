import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/view_models/signin_view_model.dart';
import 'package:litra_ar_draw_app/presentation/widgets/common/custom_alert_dialog.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/custom_input_field.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/continue_button.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email ="",password ="", fullName = "";

  final _formKey = GlobalKey<FormState>();

  SignInView({super.key});

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
            SizedBox(height: 16,),
            _buildTopFiled(),
            SizedBox(height: 16,),
            _buildBottomContent(context)
          ],
        ),

    Consumer<SigInViewModel>(
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
            fontSize: 32,
            fontFamily: 'Outfit',
            height: 1,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Text("Welcome",
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Outfit',
            height: 1,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32))
        ),
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
                  Form(
                    key: _formKey,
                    child: _buildTextFiled()
                  ),
                  SizedBox(height: 12),
                  ContinueButton(
                    title: "Sing Up",
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF50C4ED),
                    onPressButton: () {
                      final viewModel = Provider.of<SigInViewModel>(context, listen: false);

                      if(_formKey.currentState!.validate()){
                        email = emailController.text;
                        fullName = fullNameController.text;
                        password = passwordController.text;
                      }
                      viewModel.register(email,password,fullName,(){
                        //Kullanıcıya doğrulama maili gönderildiğine dair show dialog göstereceğim burda.
                        _showCustomDialog(context,(){
                            context.go('/logIn');
                          }
                        );

                      });
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
                  SizedBox(height: 24,),
                  Text(
                      "Or continue with",
                      // Yazım hatasını düzelttim: Creat -> Create
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        height: 1,
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
                          "Do you have an account? ",
                          // Yazım hatasını düzelttim: Creat -> Create
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            height: 1,
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
                              height: 1,
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
      ),
    );
  }

  Widget _buildTextFiled() {
    return Consumer<SigInViewModel>(builder: (context, viewModel, child) {
      return Column(
        children: [
          CustomInputField(
            title: "Full Name",
            icon: "assets/icons/user_icon.svg",
            hint: "Muhammed Turgut",
            controller: fullNameController,
            validator: (value) {
              if (value == "") {
                return 'This place cant be empty';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomInputField(
            title: "E-mail adress",
            icon: "assets/icons/email_icon.svg",
            hint: "example@gmail.com",
            controller: emailController,
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
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your password';
              }
              if (value.length < 8) {
                return 'Your password must be at least 8 characters.';
              }
              return null;
            },
          ),
        ],
      );
    });

  }

  void _showCustomDialog(BuildContext context, Function function) {
    showDialog(
      context: context,
      barrierDismissible: true, // Diyalog dışına tıklanınca kapanma izni
      builder: (BuildContext dialogContext) {
        return CustomAlertDialog(
          title: 'Confirmation email sent',
          content: "Please check your email address. If you haven't received the verification code, try again with a valid email address.",
          icons: "email_send_successful.svg",
          buttonTitle: "continue",
          onConfirm: () {
            function();
          },
        );
      },
    );
  }
}