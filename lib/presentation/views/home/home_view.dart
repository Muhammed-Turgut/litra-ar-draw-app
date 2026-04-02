import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/atelier_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/explore_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/favorite_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/profile_tab.dart';
import 'package:litra_ar_draw_app/presentation/views/home/taps/detail_bottom_bar.dart';
import 'package:litra_ar_draw_app/presentation/views/subscription_selection_view.dart';

import '../../widgets/home/home_bottom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  BannerAd? myBanner;
  bool _isBannerLoaded = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-6184842514914637/4570947815',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isBannerLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("Reklam hatası: $error");
        },
      ),
    );

    myBanner!.load();
  }

  @override
  void dispose() {
    myBanner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      AtelierTab(),
      ExploreTab(() {
        context.go("/home/sharePost");
      }),
      DetailBottomBar(),
      FavoriteTab(),
      ProfileTab(
        goLevel: () {
          context.go('/home/levelView');
        },
        goSharePost: () {
          context.go('/home/sharePost');
        },
      ),
    ];

    return Scaffold(
      body: SafeArea(top: true, bottom: true, child: _pages[_selectedIndex]),
      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 2) {
            _openDetailPanel(context);
            return;
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  // ✅ Sınıfın İÇİNDE
  void _openDetailPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.9,
            minChildSize: 0.2,
            builder: (_, controller) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    controller: controller,
                    children: [
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

                      GestureDetector(
                        onTap: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubscriptionSelectionView(),
                            ),
                          );

                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFDD34D), Color(0xFF50C4ED)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/premium_icon.svg"),
                                SizedBox(width: 8),
                                Text(
                                  "Remove Ads",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      ,

                      SizedBox(height: 16),

                      // ✅ myBanner ve _isBannerLoaded artık erişilebilir
                      if (_isBannerLoaded && myBanner != null)
                        Container(
                          alignment: Alignment.center,
                          width: myBanner!.size.width.toDouble(),
                          height: myBanner!.size.height.toDouble(),
                          child: AdWidget(ad: myBanner!),
                        ),

                      SizedBox(height: 16),

                      Row(
                        children: [
                          Text(
                            "Other Features",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildItem("Add Gallery", "image_plus_icon.svg", Color(0xFF50C4ED), () {}),
                          _buildItem("Category", "category_icon.svg", Color(0xFFFBA834), () {}),
                          _buildItem("Share", "share_arrow_icon.svg", Color(0xFFE946EA), () {
                            context.go('/home/sharePost');
                          }),
                          _buildItem("Instagram", "instagram_icon.svg", Color(0xFFEB4335), () {}),
                        ],
                      ),

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildItem("About Developer", "about_faq_icon.svg", Color(0xFFF23FA1), () {}),
                        ],
                      ),
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

  // ✅ Sınıfın İÇİNDE
  Widget _buildItem(
      String itemName,
      String itemIcon,
      Color color,
      Function onPress,
      ) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Center(child: SvgPicture.asset("assets/icons/$itemIcon")),
          ),
          Text(
            itemName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Outfit',
            ),
          ),
        ],
      ),
    );
  }

}