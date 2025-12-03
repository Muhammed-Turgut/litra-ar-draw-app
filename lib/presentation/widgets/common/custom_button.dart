import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderWidth;
  final VoidCallback onPressButton;
  final String? icon;
  final double widthButton;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressButton,
    required this.widthButton,
    this.backgroundColor,
    this.foregroundColor,
    this.borderWidth,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthButton,
      height: 60.h,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
                if (icon == null) ...[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/chevron_right_icon.svg",
                    width: 24.w,
                    height: 24.h,
                  ),
                ] else ...[
                  SvgPicture.asset(
                    "assets/icons/chevron_left_icon.svg",
                    width: 24.w,
                    height: 24.h,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],

              ]
          )
      ),
    );
  }
}
