import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litra_ar_draw_app/domain/entities/category_items_entity.dart';
import 'package:litra_ar_draw_app/presentation/view_models/atelier_view_model.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_row_item.dart';
import 'package:provider/provider.dart';

class DrawCategoryItem extends StatefulWidget {
  final String title;
  final String category;
  final VoidCallback onTapMore;
  final Function(CategoryItemEntity item) onTapItem;

  const DrawCategoryItem({
    super.key,
    required this.title,
    required this.category,
    required this.onTapMore,
    required this.onTapItem,
  });

  @override
  State<DrawCategoryItem> createState() => _DrawCategoryItemState();
}

class _DrawCategoryItemState extends State<DrawCategoryItem> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<AtelierViewModel>()
          .getCategoryItem(widget.category);
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){

    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
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

        Consumer<AtelierViewModel>(
          builder: (context, viewModel, child) {
            final list = viewModel.getCategoryList(widget.category);

            return SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: DrawRowItem(
                      onTabItem: (){
                        final item = list[index];
                        widget.onTapItem(item);
                      },
                      item: list[index],
                    ),
                  );
                },
              ),
            );
          },
        ),



        const SizedBox(height: 16),
      ],
      )
    );
  }


}
