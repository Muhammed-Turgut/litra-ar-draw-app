import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/atelier_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/explore_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/favorite_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/profile_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/share_tab.dart';

import '../../widgets/home/home_bottom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages =
  [
    AtelierTab(),
    ExploreTab(),
    ShareTab(),
    FavoriteTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: SafeArea(
           top: true,
           bottom: true,
           child: _pages[_selectedIndex]),
       bottomNavigationBar: HomeBottomNavBar(
           currentIndex: _selectedIndex,
           onTap: (index){
             setState(() {
               _selectedIndex = index;
             });
           }
       )
    );
  }
}
