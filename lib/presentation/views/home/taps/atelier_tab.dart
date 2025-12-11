import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_category_item.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_row_item.dart';

class AtelierTab extends StatelessWidget {

  final List<DrawRowItem> _list = [
    DrawRowItem(image: "example_v.png", state: true, onTabItem: (){}),
    DrawRowItem(image: "example_vv.png", state: false, onTabItem: (){}),
    DrawRowItem(image: "example_vvv.png", state: true, onTabItem: (){}),
    DrawRowItem(image: "example_vvvv.png", state: false, onTabItem: (){}),

  ];

  AtelierTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF50C4ED),
       body: SafeArea(
         bottom: true,
           top: true,
           child: _buildBody()),
    );
  }

  Widget _buildBody() {

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildTopFiled(),
          _buildContentField()
        ],
      ),
    );

  }

  Widget _buildTopFiled(){

    return Stack(
      children: [
         SvgPicture.asset("assets/images/backgroun_materyal.svg",fit: BoxFit.cover,),
         Image.asset("assets/images/atelier_top_filed_image.png"),
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SizedBox(height: 28),
               Text("Litra AR Draw",
                 style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Outfit',
                     height: 1.1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                 ),
               ),

               Text("Sanat Parmak Uçlarında",
                 style: TextStyle(
                     fontSize: 16,
                     height: 1.1,
                     fontFamily: 'Outfit',
                     fontWeight: FontWeight.w300,
                     color: Colors.white
                 ),
               )
             ],
           ),
         )
      ],
    );
  }

  Widget _buildContentField() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFFFCF8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,top: 24, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            DrawCategoryItem(title: "Basic",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Animals",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Nature",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Vehicles",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Countrys",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "People",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Buildings",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Fashion",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Anime",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Cartoons",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Fantasy",onTapItem: (){},onTapMore: (){},list: _list),

          ],
        ),
      ),
    );
  }
}


