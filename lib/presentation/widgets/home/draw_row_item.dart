import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litra_ar_draw_app/domain/entitys/category_entity.dart';
import 'package:litra_ar_draw_app/presentation/widgets/common/shimmer_box.dart';

class DrawRowItem extends StatelessWidget {

  final VoidCallback onTabItem;
  final CategoryEntity item;

  const DrawRowItem({
    required this.onTabItem,
    required this.item
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(onTap: (){
        onTabItem();
    },child: AspectRatio(
      //AspectRatio, içindeki widget’ın genişlik / yükseklik oranını korumaya zorlayan bir layout widget’tır.
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFFF5F5F5), width: 2),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const ShimmerBox(
                      width: 100,
                      height: 120,
                    );
                  },
                  errorBuilder: (_, __, ___) {
                    return const ShimmerBox(
                      width: 100,
                      height: 120,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: SvgPicture.asset(
                "assets/icons/default_star_icon.svg",
                width: 18,
                height: 18,
              ),
            ),
          ],
        ),
      ),
    ));

  }
}
