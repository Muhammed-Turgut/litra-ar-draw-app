import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_row_item.dart';

class DrawCategoryItem extends StatelessWidget {
  final String title;
  final List<DrawRowItem> list;
  final VoidCallback onTapMore;
  final VoidCallback onTapItem;

  DrawCategoryItem({
    Key? key,
    required this.title,
    required this.list,
    required this.onTapMore,
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              "more",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                color: Color(0xFFFBA834),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: 120, // <-- YATAY LİSTE YÜKSEKLİĞİ
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),  // elemanlar arası boşluk
                child: list[index],
              );// DrawRowItem
            },
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
