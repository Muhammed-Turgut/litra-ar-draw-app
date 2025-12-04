import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawRowItem extends StatelessWidget {
  final String image;
  final bool state;
  final VoidCallback onTabItem;
  final int? index;

  DrawRowItem({
    Key?key,
    required this.image,
    required this.state,
    required this.onTabItem,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Image.asset("assets/images/${image}",fit: BoxFit.scaleDown)),
          ),
          Positioned(
              top: 8,
              right: 8,
              child: SvgPicture.asset("assets/icons/${ state ? "selected_star_icon.svg " : "default_star_icon.svg"}",width: 18, height: 18,)
          )

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(
            color: Color(0xFFF5F5F5),   // çizgi rengi
            width: 2,              // çizgi kalınlığı
        )
      ),
    );
  }
}
