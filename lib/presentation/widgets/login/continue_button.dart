import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ContinueButton extends StatelessWidget {

  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderWidth;
  final VoidCallback onPressButton;
  final double widthButton;

  const ContinueButton({
    Key? key,
    required this.title,
    required this.onPressButton,
    required this.widthButton,
    this.backgroundColor,
    this.foregroundColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthButton,
      height: 60,
      child: ElevatedButton(
          onPressed: () {
            onPressButton();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? const Color(0xFF50C4ED),
            foregroundColor: foregroundColor ?? Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100), // isteğe bağlı
              side: BorderSide(
                color: foregroundColor ?? Colors.white, // çerçeve rengi
                width: borderWidth ?? 0,            // stroke genişliği
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600,
            ),
          )
      ),
    );
  }
}
