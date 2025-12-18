import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_category_item.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_row_item.dart';

class AtelierTab extends StatelessWidget {


  //Firebasde Storage de veri çekerken kullanılacak.
 // final String BASE_URL = "https://firebasestorage.googleapis.com/v0/b/litra-ar-draw.firebasestorage.app/o/animal_color_duck.png?alt=media&token=";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF50C4ED),
       body: SafeArea(
         bottom: true,
           top: true,
           child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildTopFiled(),
          _buildContentField(context)
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

               Text("Art at your fingertips",
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

  Widget _buildContentField(BuildContext context) {
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

            /*DrawCategoryItem(title: "Basic",onTapItem: (item){
              context.go('/home/chooseDrawType',
                         extra: item
              );},onTapMore: (){},category:"basic"),*/

            DrawCategoryItem(title: "Animals",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "animal"),

            DrawCategoryItem(title: "Nature",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "nature"),

            DrawCategoryItem(title: "Vehicles",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "vehicles"),


           /* DrawCategoryItem(title: "People",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "people"),*/

          /*  DrawCategoryItem(title: "Buildings",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "buildings"),*/

           /* DrawCategoryItem(title: "Fashion",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "fashion"),*/

            DrawCategoryItem(title: "Anime",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "anime"),

            DrawCategoryItem(title: "Cartoons",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "cartoons"),

            DrawCategoryItem(title: "Fantasy",onTapItem: (item){
              context.go('/home/chooseDrawType',
                  extra: item
              );},onTapMore: (){},category: "fantasy"),

          ],
        ),
      ),
    );
  }
}


