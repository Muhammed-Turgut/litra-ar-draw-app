import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomNavBar extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTap;

  const HomeBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem("selected_atelier_icon.svg", "default_atelier_icon.svg", "Atelier", 0),
          _buildNavItem("selected_explore_icon.svg", "default_explore_icon.svg", "Explore", 1),
          _buildNavItem("palette_icon.svg", "palette_icon.svg", "", 2),
          _buildNavItem("selected_favorite_icon.svg", "default_favorite_icon.svg", "Favorites", 3),
          _buildNavItem("selected_profile_icon.svg", "default_profile_icon.svg", "Profile", 4),
        ],
      ),
    ));

  }

  Widget _buildNavItem(String selectedIcon, String defaultIcon, String label, int index) {

    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 4),
        decoration: BoxDecoration(
            color:Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/${isActive ? selectedIcon : defaultIcon}",width: 24, height: 24),
            if(isActive)
              Padding(padding: const EdgeInsets.only(left: 6),
                child: Text(
                  label,
                  style: const TextStyle(
                    color:  Color(0xFF50C4ED),
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
          ],
        ),
      ),
    );

  }
}
