// CustomAlertDialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/continue_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final String icons;
  final String content;
  final VoidCallback onConfirm;

  const CustomAlertDialog({
    required this.title,
    required this.buttonTitle,
    required this.icons,
    required this.content,
    required this.onConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      child:Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24))
          ),// İstediğiniz sabit veya dinamik genişlik
          child: Column(
              mainAxisSize: MainAxisSize.min, // İçeriğe göre boyutu ayarla
              children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                  GestureDetector(
                    onTap: (){
                      context.pop();
                    },
                    child: SvgPicture.asset("assets/icons/cancel_icon.svg",width: 36, height: 36,),
                  )
                 ],
               ),
                SizedBox(height: 16,),

                SvgPicture.asset("assets/icons/$icons",width: 140, height: 140),
                SizedBox(height: 20),
                Text(title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                 ),
                ),
                SizedBox(height: 8),
                Text(content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w300,
                      fontSize: 14
                  ),
                ),
                SizedBox(height: 20),
                ContinueButton(
                  title: buttonTitle,
                  onPressButton: (){
                    onConfirm();
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF50C4ED),
                  widthButton: double.infinity,
                ),
              ],
            ),
          ),
    );
  }
}