import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/atelier_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/explore_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/favorite_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/profile_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/detail_bottom_bar.dart';

import '../../widgets/home/home_bottom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages =
    [
      AtelierTab(),
      ExploreTab(),
      DetailBottomBar(),
      FavoriteTab(),
      ProfileTab(onTap: (){
        context.go('/home/levelView');
      },
      )
    ];

    return  Scaffold(
       body: SafeArea(
           top: true,
           bottom: true,
           child: _pages[_selectedIndex]),
        bottomNavigationBar: HomeBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (index == 2) {
              _openDetailPanel(); // panel aç
              return;
            }

            setState(() {
              if (index > 2) {
                _selectedIndex = index;
              } else {
                _selectedIndex = index;
              }
            });
          },
        )
    );
  }
  void _openDetailPanel() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,     // ekranın 90%’ına kadar açılabilsin
      backgroundColor: Colors.transparent, // arka plan saydam
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context), // arka plana tıklayınca kapansın
          child: DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.9,
            minChildSize: 0.2,
            builder: (_, controller) {
              return GestureDetector(
                onTap: () {}, // içerik tıklanınca kapanmasın
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    controller: controller,
                    children:  [
                      SizedBox(height: 16),
                      Center(
                        child: Divider(
                          color: Color(0xFF50C4ED),
                          indent: 150,
                          endIndent: 150,
                          thickness: 4,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(children: [
                        Text("Other Features",
                          style: TextStyle(
                             color: Colors.black,
                             fontSize: 20,
                             fontFamily: 'Outfit',
                             fontWeight: FontWeight.w500
                           )
                         )
                        ],
                      ),

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          _buildItem("Add Gallery","image_plus_icon.svg",Color(0xFF50C4ED),(){

                          }),

                          _buildItem("Category","category_icon.svg",Color(0xFFFBA834),(){

                          }),

                          _buildItem("Share","share_arrow_icon.svg",Color(0xFFE946EA),(){

                          }),

                          _buildItem("Instagram","instagram_icon.svg",Color(0xFFEB4335),(){

                          }),
                          
                        ],
                      ),
                     SizedBox(
                       height: 16,
                     ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          _buildItem("About Developer","about_faq_icon.svg",Color(0xFFF23FA1),(){

                          }),

                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildItem(String itemName,String itemIcon, Color color, Function onPress,) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Center(
            child: SvgPicture.asset("assets/icons/$itemIcon"),
          ),
        ),
        Text(itemName,
          style: TextStyle(
              color: Colors.black,
              fontSize:12,
              fontFamily: 'Outfit'
          ),
        )
      ],
    );
  }

}
