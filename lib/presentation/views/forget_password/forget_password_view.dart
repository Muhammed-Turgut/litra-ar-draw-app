import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/view_models/login_view_model.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/continue_button.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/custom_input_field.dart';
import 'package:provider/provider.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();

  String email ="";

  final _formKey = GlobalKey<FormState>();

  bool _pageChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        top: true,
        child: SingleChildScrollView(
          child:_buildBody(context),
        )
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        if(_pageChange)
          _buildSendEmailBody(context)
        else
         _buildSendEmailSuccessful(context)
      ],
    );
  }

  Widget _buildSendEmailBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  context.go('/logIn');
                },
                child: SvgPicture.asset("assets/icons/arrow_back_icon.svg",width: 36, height: 36),
              ),

            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 190),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SvgPicture.asset("assets/icons/forget_password_icon.svg",width: 205,height: 210),
                  SizedBox(height: 24,),
                  Text("Reset Your Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  SizedBox(height: 8,),

                  Text("Please enter the email address to which you\nwould like the password reset link to be sent.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.1,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  SizedBox(height: 24,),

                  Form(
                      key: _formKey,
                      child: CustomInputField(
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
                      )),
                  SizedBox(height: 24,),

                  Consumer<LoginViewModel>(builder: (context,viewModel,chid){
                    return  ContinueButton(title: "Send Email",
                        onPressButton: (){
                          setState(() {
                            email = _emailController.text;
                            viewModel.resetPassword(email,(){
                              setState(() {
                                _pageChange = false;
                              });
                             }
                            );
                          });
                        }, widthButton: double.infinity);
                  },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSendEmailSuccessful(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  context.go('/logIn');
                },
                child: SvgPicture.asset("assets/icons/arrow_back_icon.svg",width: 36, height: 36),
              ),

            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 190),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SvgPicture.asset("assets/icons/email_send_successful.svg",width: 205,height: 210),
                  SizedBox(height: 24,),
                  Text("Reset email sent successfully",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  SizedBox(height: 8,),

                  Text("Check your mailbox if it is not among the\nrecently sent emails. Check your spam\nbox or your link.\nIf you receive the link, please check your email address and try again.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.1,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  SizedBox(height: 24,),
                  ContinueButton(title: "Send new link",
                        onPressButton: (){
                          setState(() {
                            _pageChange = true;
                            _emailController.text = "";
                          });
                        },
                      widthButton: double.infinity)

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
