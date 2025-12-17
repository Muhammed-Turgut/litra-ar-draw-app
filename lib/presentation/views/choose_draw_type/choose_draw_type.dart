import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/domain/entitys/category_entity.dart';
import 'package:litra_ar_draw_app/presentation/widgets/common/custom_button.dart';

class ChooseDrawType extends StatefulWidget {

  final CategoryEntity categoryEntity;

  ChooseDrawType({required this.categoryEntity});

  @override
  State<ChooseDrawType> createState() => _ChooseDrawTypeState();
}

class _ChooseDrawTypeState extends State<ChooseDrawType> {
  int _choose = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
         top: true,
         bottom: true,
        child: Scaffold(
        backgroundColor: Color(0xFFFFFCF8),
        body: _buildBody(context)
      )
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
           Padding(
             padding: const EdgeInsets.only(top: 4.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 GestureDetector(onTap: (){
                    context.go('/home');
                 },
                 child: SvgPicture.asset("assets/icons/arrow_back_icon.svg",width: 36, height: 36,),
                 )
               ],
             ),
           ),

          SizedBox(height: 12),
          Text("Choose Drawing Shape",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
          ),
          SizedBox(height: 16),
          _buildChooseType((){
            setState(() {
              _choose = 1;
            });
          },
            "choose_draw_one.gif",
           _choose == 1,
           "With camera",
           "Position the phone so that it is slightly above the drawing area."),

          SizedBox(height: 24),
          _buildChooseType((){
            setState(() {
              _choose = 2;
            });
          },
           "choose_draw_two.gif",
           _choose == 2,
           "with screen",
           "Lock the screen and draw using the screen lock feature."),
          SizedBox(height: 24),

          CustomButton(
            title: "Continue",
            onPressButton: (){
                context.go('/home/chooseDrawType/cameraView',
                 extra: widget.categoryEntity);
            },
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF50C4ED),
            widthButton: double.infinity,

          )


        ],
      ),
    );
  }

  Widget _buildChooseType(
      Function function,
      String gif,
      bool isActive,
      String title,
      String content){

    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: double.infinity,
        height: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? Color(0xFF50C4ED) : Color(0xFFF5F5F5),
            width: isActive ? 3 : 3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 GIF AREA
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
              child: Stack(
                children: [
                  SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/anim/$gif",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: SvgPicture.asset(
                      "assets/icons/${isActive ? "selected_icon.svg" : "default_icon.svg"}",
                      width: 28,
                      height: 28,
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 TEXT AREA
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
