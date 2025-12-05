import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_category_item.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_row_item.dart';

class AtelierTab extends StatelessWidget {

  List<DrawRowItem> _list = [
    DrawRowItem(image: "example_v.png", state: true, onTabItem: (){}),
    DrawRowItem(image: "example_vv.png", state: false, onTabItem: (){}),
    DrawRowItem(image: "example_vvv.png", state: true, onTabItem: (){}),
    DrawRowItem(image: "example_vvvv.png", state: false, onTabItem: (){}),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF50C4ED),
       body: _buildBody(),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 16,top: 24, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            DrawCategoryItem(title: "Basic Drawing Categories",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "People Drawing",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "For Kids",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Anime",onTapItem: (){},onTapMore: (){},list: _list),
            DrawCategoryItem(title: "Cartoon",onTapItem: (){},onTapMore: (){},list: _list)

          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFFCF8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
    );
  }
}


