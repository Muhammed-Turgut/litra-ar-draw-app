import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerticalScoreBar extends StatelessWidget {
  final double value; // 0.0 - 1.0 arası değer
  final double width;
  final double height;

  const VerticalScoreBar({
    super.key,
    required this.value,
    this.width = 30,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    final double fillHeight = value*0.8;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Arka plan bar
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFECECEC)
            ),
          ),

          // Dolu alan
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: fillHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFF18C8EE),
                    Color(0xFF1D91E0),
                    Color(0xFFCD42E7),
                    Color(0xFFFCC636),
                  ],
                ),
              ),
            ),
          ),

          // İkon (dolu alanın tepesine gelecek)
          Positioned(
            bottom: fillHeight - 12, // ikon merkezini ayarlamak için
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/spark_icon.svg",width: 24,height: 24,),
                Text("$value",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Outfit',
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [
                        Color(0xFF18C8EE),
                        Color(0xFF1D91E0),
                        Color(0xFFCD42E7),
                        Color(0xFFFCC636),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(
                      Rect.fromLTWH(0, 0, 200, 70), // yazının kapsama alanı
                    ),
                ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
