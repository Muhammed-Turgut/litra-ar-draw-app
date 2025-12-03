import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInputField extends StatelessWidget {
  final String icon;
  final String title;
  final String hint;
  final TextEditingController controller;

  CustomInputField({
      Key? key,
      required this.icon,
      required this.title,
      required this.controller,
      required this.hint
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    // Genellikle ekranın ortasında göstermek için bir Center ve Padding kullanırız
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Color(0xFF858585),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10, right: 8),
          child: SvgPicture.asset(icon, width: 18.w, height: 18.h),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        filled: true,
        fillColor: const Color(0xFFFFFCF8),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),

        labelText: title,
        labelStyle: const TextStyle(
          color: Color(0xFF969696),
          fontWeight: FontWeight.w500,
          fontFamily: 'Outfit',
          fontSize: 16,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF969696),
          fontWeight: FontWeight.w400,
          fontFamily: 'Outfit',
          fontSize: 12,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always, // label hep üstte
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: Color(0xFFF5F5F5),
            width: 1
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: Color(0xFF50C4ED),  // normal durumdaki border rengi
            width: 2,
          ),
        ),
      ),
    );

  }

  }