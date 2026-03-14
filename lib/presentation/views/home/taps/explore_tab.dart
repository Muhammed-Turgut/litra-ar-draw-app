import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litra_ar_draw_app/domain/entities/users_post_item.dart';
import 'package:litra_ar_draw_app/presentation/services/image_picker_services.dart';
import 'package:litra_ar_draw_app/presentation/view_models/explore_view_model.dart';
import 'package:litra_ar_draw_app/presentation/widgets/explore/vertical_score_bar.dart';
import 'package:provider/provider.dart';

class ExploreTab extends StatefulWidget {

  final Function function;

  ExploreTab(this.function);

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  final ImagePickerService _imagePickerService = ImagePickerService();

  final List<String> _categoryList = [
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

  int _selected = 0;

  @override
  void initState() {
    super.initState();
  }

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
        SizedBox(height: 16),
        Text("Explore", style: TextStyle(
           color: Colors.black,
           fontSize: 20,
           fontFamily: 'Outfit',
           fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height: 8),
        _buildUploadImageAre(context),
        SizedBox(height: 12),
        _buildCategory(),
        SizedBox(height: 12),
        _buildPostsList(context),
      ],
    );
  }

  Widget _buildUploadImageAre(BuildContext context) {
    
   return Consumer<ExploreViewModel>(builder: (context,viewModel,child){
     return SizedBox(
         width: double.infinity,
         height: 138,
         child: GestureDetector(onTap:() {
            widget.function();
         },child: Stack(
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
         )
     );
    }
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

  Widget _buildPostsList(BuildContext context) {
    return Consumer<ExploreViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading && viewModel.postList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        debugPrint("post list lenght: ${viewModel.postList.length}");


        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.postList.length,
          itemBuilder: (context, index) {
            return _buildPostItem(viewModel.postList[index], viewModel);
          },
        );
      },
    );
  }

  Widget _buildPostItem(UsersPostItem item, ExploreViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: IntrinsicHeight(
        // AspectRatio yerine IntrinsicHeight kullandım, içerik uzunsa widget genişler
        child: Container(
          constraints: BoxConstraints(
            minHeight: 280, // Minimum yükseklik
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Color(0xFFF5F5F5), width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // İçeriğe göre boyutlanır
              children: [
                // Yıldız ikonu
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/selected_star_icon.svg",
                      width: 24,
                      height: 24,
                    )
                  ],
                ),

                // Spark bar, resim ve boş alan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VerticalScoreBar(
                      value: (item.sparkScore ?? 0.0).toDouble(),
                      width: 12,
                      height: 180,
                    ),
                    Image.network(
                      item.imageUrl,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 10,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                SizedBox(height: 8), // Biraz boşluk

                // Başlık ve Spark butonu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          item.postTitle ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2, // Başlık çok uzunsa 2 satıra çıkar
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("assets/icons/spark_icon.svg"),
                            SizedBox(width: 4),
                            Text(
                              "Spark",
                              style: TextStyle(
                                color: Color(0xFF50C4ED),
                                fontSize: 14,
                                height: 0.5,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 8), // Biraz boşluk

                // Açıklama - Flexible ile uyumlu hale getirildi
                Flexible(
                  fit: FlexFit.loose, // İçeriğe göre boyutlanır ama gereksiz yer kaplamaz
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        item.postContent ?? "",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        maxLines: 4, // 3'ten 4'e çıkardım, biraz daha fazla gösterir
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 4), // Alt boşluk
              ],
            ),
          ),
        ),
      ),
    );
  }

}
