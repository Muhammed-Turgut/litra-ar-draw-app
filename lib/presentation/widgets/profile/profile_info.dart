import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String level;
  final String fullName;

  ProfileInfo({
    required this.level,
    required this.fullName
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Dikeyde hizalama
      children: [
        Container(
          width: 60,   // Dış çerçeve boyutu
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,          // Yuvarlak şekil
            border: Border.all(
              color: Color(0xFFF5CD74),            // Çerçeve rengi
              width: 4,                      // Çerçeve kalınlığı
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              "assets/images/seed_selected_image.png",
              width: 54,
              height: 54,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, // Butonla aynı dikey seviyede tutmak için
          children: [
            const Text(
              "Muhammed Turgut",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.1,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: const [ // const eklendi
                Text(
                  "Level: ",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.1,
                    color: Colors.white,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  " Seed",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
