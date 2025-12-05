import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litra_ar_draw_app/domain/entitys/users_post_item.dart';
import 'package:litra_ar_draw_app/presentation/widgets/explore/vertical_score_bar.dart';

class ExploreTab extends StatefulWidget {

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  List<String> _categoryList = [
    "All",
    "Basic",
    "Animals",
    "Nature",
    "Vehicles",
    "People",
    "Architecture",
    "Fashion",
    "Anime",
    "Cartoons",
    "Fantasy"
  ];

 List<String> _postList = [
      "",
   "",
   ""
 ];

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF8),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: 8),
        _buildUploadImageAre(context),
        SizedBox(height: 12),
        _buildCategory(),
        SizedBox(height: 12),
        _buildPostsList(),
      ],
    );
  }

  Widget _buildUploadImageAre(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 138,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/images/upload_image_are.svg",
              fit: BoxFit.contain,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/image_plus_icon.svg"),
                Text("Upload Image",
                 style: TextStyle(
                   color: Colors.white,
                   fontFamily: 'Outfit',
                   fontSize: 16,
                   fontWeight: FontWeight.w500,
                   height: 1.1
                 ),
                ),
                Text("Add your own drawings",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Outfit',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1.1
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildCategory() {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: _buildCategoryItem(
              _categoryList[index],
              _selected == index,
              index
            ),
          );
        },
      ),
    );
  }
  Widget _buildCategoryItem(String categoryName, bool selection, int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _selected = index;
        });
      },
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(categoryName,
         style: TextStyle(
           color: selection ? Color(0xFFFF9C13) : Color(0xFFA3A3A3),
           fontSize: selection ? 18: 14,
           fontFamily: 'Outfit',
           fontWeight: selection ? FontWeight.w500 : FontWeight.w400
         )
        ),
        if(selection)
        Container(
          width: 16,
          height: 4,
          decoration: BoxDecoration(
            color: Color(0xFFFF9C13),
            borderRadius: BorderRadius.all(Radius.circular(100))
          ),
        )
      ],
     )
    );

  }

  Widget _buildPostsList() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
           return _buildPostItem();
        },itemCount: _postList.length,
      ),
    );
  }

  Widget _buildPostItem() {
       return Padding(
         padding: const EdgeInsets.only(bottom: 12.0),
         child: AspectRatio(
           //AspectRatio, içindeki widget’ın genişlik / yükseklik oranını korumaya zorlayan bir layout widget’tır.
             aspectRatio: 1,
             child:Container(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           SvgPicture.asset("assets/icons/default_user_profile_image.svg",width: 36, height: 36,),
                           SizedBox(width: 4,),
                           Text("Muhammed Turgut",
                           style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400
                            )
                           )
                         ],
                       ),
                       SvgPicture.asset("assets/icons/selected_star_icon.svg",width: 24, height: 24,)
                     ],
                   ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     VerticalScoreBar(value: 200, width: 12,height: 180,),
                     Image.asset("assets/images/example_post_v.png", width: 200, height: 200,),
                     Stack(
                       clipBehavior: Clip.none,
                       alignment: Alignment.bottomCenter,
                       children: [
                         // Arka plan bar
                         Container(
                           width: 10,
                           height: 8,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               color: Colors.white
                           ),
                         ),
                         ]
                     )
                   ],
                 ),
                 
                 Expanded(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Lorem ipsum dolor sit amet ",
                        style: TextStyle(
                          color:  Colors.black,
                          fontSize: 14,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500
                        ),
                       ),

                      ElevatedButton(onPressed: (){

                      },

                       child: Row(
                         children: [
                           SvgPicture.asset("assets/icons/spark_icon.svg"),
                           SizedBox(width: 4,),
                           Text("Spark",
                            style: TextStyle(
                               color: Color(0xFF50C4ED),
                               fontSize: 14,
                               height: 0.5,
                               fontFamily: 'Outfit',
                               fontWeight: FontWeight.w500
                            ),
                           )
                         ],
                       ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical:4),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(
                              color: Color(0xFF50C4ED),
                              width: 1,
                            ),
                          ),
                        )
                      )
                     ],
                   ),
                 ),
                 Text("Lorem ipsum dolor sit amet consectetur. Adipiscing ante viverra faucibus posuere ut. Mauris pellentesque turpis accumsan in quam convallis.",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Outfit',
                    fontSize: 12,
                    fontWeight: FontWeight.w300
                  ),
                     maxLines: 3,                 // 👉 En fazla 3 satır göster
                     overflow: TextOverflow.ellipsis
                 )
               ],
             ),
           ),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.all(Radius.circular(12)),
             border: Border.all(color: Color(0xFFF5F5F5),width: 2)
           ),
           )
         ),
       );
  }
}
