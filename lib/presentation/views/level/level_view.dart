import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LevelView extends StatelessWidget {

   int _isActive = 0;

   List<LevelItem> _levelList = [
     LevelItem(
         activeImage: "seed_selected_image.png",
         deActiveImage: "seed_default_image.png",
         levelMeaningfulSentence: "Every line is the trace of a beginning.",
         levelName: "Seed",
         levelNumber: "1.Level"
       ),

     LevelItem(
         activeImage: "sapling_selected_level_iamge.png",
         deActiveImage: "sapling_default_level_iamge.png",
         levelMeaningfulSentence: "It’s not the hand that draws, but the imagination.",
         levelName: "Sapling",
         levelNumber: "2.Level"
     ),

     LevelItem(
         activeImage: "scribble_selected_level_iamge.png",
         deActiveImage: "scribble_default_level_iamge.png",
         levelMeaningfulSentence: "Small steps lead to great art.",
         levelName: "Scribble",
         levelNumber: "3.Level"
     ),

     LevelItem(
         activeImage: "line_selected_level_image.png",
         deActiveImage: "line_default_level_image.png",
         levelMeaningfulSentence: "Even imperfect lines guide the way.",
         levelName: "Line",
         levelNumber: "4.Level"
     ),


     LevelItem(
         activeImage: "shadow_selected_level_image.png",
         deActiveImage: "shadow_default_level_image.png",
         levelMeaningfulSentence: "Every mistake becomes a teacher.",
         levelName: "Shadow",
         levelNumber: "5.Level"
     ),

     LevelItem(
         activeImage: "perspective_selected_level_iamge.png",
         deActiveImage: "perspective_default_level_iamge.png",
         levelMeaningfulSentence: "Colors speak louder than words.",
         levelName: "Perspective",
         levelNumber: "6.Level"
     ),

     LevelItem(
         activeImage: "canvas_selected_level_image.png",
         deActiveImage: "canvas_default_level_image.png",
         levelMeaningfulSentence: "The more you draw, the clearer the world becomes.",
         levelName: "Canvas",
         levelNumber: "7.Level"
     ),

     LevelItem(
         activeImage: "palette_selected_level_image.png",
         deActiveImage: "palette_default_level_image.png",
         levelMeaningfulSentence: "Each brushstroke shapes a new version of you.",
         levelName: "Palette",
         levelNumber: "8.Level"
     ),

     LevelItem(
         activeImage: "visionary_selected_level_image.png",
         deActiveImage: "visionary_default_level_image.png",
         levelMeaningfulSentence: "Art is the silent victory of patience.",
         levelName: "Visionary",
         levelNumber: "9.Level"
     ),

     LevelItem(
         activeImage: "finish_selected_level_image.png",
         deActiveImage: "finish_default_level_image.png",
         levelMeaningfulSentence: "Mastery is the soul turning into lines.",
         levelName: "Turtle Trainer",
         levelNumber: "10.Level"
     ),
   ];

   int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF50C4ED),
      body: SafeArea(
          top: true,
          bottom: false,
          child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopBar(context),
          SizedBox(
            width: double.infinity,       // Stack tam genişlik alsın
            child: Stack(
              alignment: Alignment.topCenter,  // İçerikleri ortalamak için
              children: [
                _buildBackground(),
                Column(children: [
                  SizedBox(height: 82,),
                  SvgPicture.asset("assets/icons/level_line.svg"),
                  ],
                ),


                Positioned(
                  top: 34,
                  left: 0,
                  right: 0,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[0], _isActive == 0),
                      //Image.asset("assets/images/seed_selected_image.png",width: 70, height: 70,)
                    ],
                  ),
                ),
            ////----------///
                Positioned(
                  top: 194,
                  left: 100,
                  right: 0,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[1], _isActive == 1),
                    ],
                  ),
                ),

                Positioned(
                  top: 194,
                  left: 0,
                  right: 100,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[2], _isActive == 2),
                    ],
                  ),
                ),
            ////----------///
                Positioned(
                  top: 348,
                  left: 0,
                  right: 0,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[3], _isActive == 3),
                    ],
                  ),
                ),

            ////----------///
                Positioned(
                  top: 542,
                  left: 0,
                  right: 100,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[4], _isActive == 4),
                    ],
                  ),
                ),

                Positioned(
                  top: 542,
                  left: 100,
                  right: 0,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[5], _isActive == 5),
                    ],
                  ),
                ),
              ////----------///
                Positioned(
                  top: 716,
                  left: 0,
                  right: 0,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[6], _isActive == 6),
                    ],
                  ),
                ),

                ////----------///
                Positioned(
                  top: 864,
                  left: 0,
                  right: 100,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[7], _isActive == 7),
                    ],
                  ),
                ),

                Positioned(
                  top: 864,
                  left: 100,
                  right: 0,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[8], _isActive == 8),
                    ],
                  ),
                ),
                ////----------///

                Positioned(
                  top: 1020,
                  left: 0,
                  right: 0,// Ortalamak için
                  child: Column(
                    children: [
                      _buildLevelItem(_levelList[9], _isActive == 9),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildBackground() {

    return Column(
      children: [
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SizedBox(height: 16),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SizedBox(height: 16),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SizedBox(height: 16),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SizedBox(height: 16),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SizedBox(height: 16),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SizedBox(height: 16),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SizedBox(height: 16),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SizedBox(height: 16),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
        SvgPicture.asset("assets/images/backgroun_materyal.svg"),
      ],
    );
 }

 Widget _buildTopBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: (){
              context.go('/home');
            },
            child: SvgPicture.asset("assets/icons/arrow_back_icon.svg", width: 28, height: 28,)
            ),
            Text("Level",
              style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 24,
                  color: Color(0xFF50C4ED),
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: 32,
              width: 32,
            )
          ],
        ),
      ),
    );
 }

 Widget _buildLevelItem(LevelItem item, bool isActive) {
    return Column(
      children: [
        Text("${isActive? item.levelMeaningfulSentence : ""}",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w300,
              height: 1,
            fontStyle: FontStyle.italic
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Container(
          width: 60,   // Dış çerçeve boyutu
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,          // Yuvarlak şekil
            border: Border.all(
              color: isActive ? Color(0xFFF5CD74) : Colors.white,            // Çerçeve rengi
              width: 4,                      // Çerçeve kalınlığı
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              "assets/images/${isActive ? item.activeImage : item.deActiveImage}",
              width: 54,
              height: 54,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(item.levelNumber,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w300,
              height: 1
          ),
        ),
        Text(item.levelName,
          style: TextStyle(
           color: Colors.white,
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
            height: 1
          ),
        )
      ],
    );
 }

}

class LevelItem{

  String? levelMeaningfulSentence;
  String activeImage;
  String deActiveImage;
  String levelName;
  String levelNumber;

  LevelItem({
    required this.activeImage,
    required  this.deActiveImage,
    required this.levelMeaningfulSentence,
    required this.levelName,
    required this.levelNumber
  });
}
