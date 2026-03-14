import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileContinueButton extends StatelessWidget {

  final VoidCallback onPress;

  ProfileContinueButton({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

        onPress();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white.withOpacity(0.2), // alpha yerine opacity
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding ayarı
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Daha yumuşak kenarlar için
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Sadece içeriği kadar yer kaplaması için
        children: [
          const Text(
            "Continue",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4), // İkon ve metin arasına boşluk
          SvgPicture.asset(
            "assets/icons/chevron_right_icon.svg",
            color: Colors.white, // İkon rengi
            height: 18, // İkon boyutu
          ),
        ],
      ),
    );
  }
}
