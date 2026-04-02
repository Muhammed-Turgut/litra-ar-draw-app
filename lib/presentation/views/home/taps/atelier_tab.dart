import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:litra_ar_draw_app/core/servics/ad_servics.dart';
import 'package:litra_ar_draw_app/presentation/views/dialog/remove_ads_dialog.dart';
import 'package:litra_ar_draw_app/presentation/views/subscription_selection_view.dart';
import 'package:litra_ar_draw_app/presentation/widgets/home/draw_category_item.dart';

class AtelierTab extends StatefulWidget {
  @override
  State<AtelierTab> createState() => _AtelierTabState();
}

class _AtelierTabState extends State<AtelierTab> {

  final AdService _adService = AdService();

  //Firebasde Storage de veri çekerken kullanılacak.
  BannerAd? myBanner;

  bool _isBannerLoaded = false;

  @override
  void initState() {
    super.initState();
    _adService.loadAd(); // Sayfa açılınca reklamı önceden yükle
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
    _adService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF50C4ED),
      body: SafeArea(bottom: true, top: true, child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [_buildTopFiled(), _buildContentField(context)],
      ),
    );
  }

  Widget _buildTopFiled() {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/backgroun_materyal.svg",
          fit: BoxFit.cover,
        ),
        Image.asset("assets/images/atelier_top_filed_image.png"),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 28),
              Text(
                "Litra AR Draw",
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Outfit',
                  height: 1.1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              Text(
                "Art at your fingertips",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.1,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
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
        padding: const EdgeInsets.only(
          left: 16,
          top: 24,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_isBannerLoaded && myBanner != null)
                  Container(
                    alignment: Alignment.center,
                    width: myBanner!.size.width.toDouble(),
                    height: myBanner!.size.height.toDouble(),
                    child: AdWidget(ad: myBanner!),
                  ),
              ],
            ),

            DrawCategoryItem(
              title: "Animals",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  context.go('/home/chooseDrawType', extra: item);

                });
              },
              onTapMore: () {},
              category: "animal",
            ),

            DrawCategoryItem(
              title: "Nature",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  _adService.showAdAndNavigate(context, (){
                    context.go('/home/chooseDrawType', extra: item);
                  });

                });

              },
              onTapMore: () {},
              category: "nature",
            ),

            DrawCategoryItem(
              title: "Vehicles",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  _adService.showAdAndNavigate(context, (){
                    context.go('/home/chooseDrawType', extra: item);
                  });

                });

              },
              onTapMore: () {},
              category: "vehicles",
            ),

            DrawCategoryItem(
              title: "People",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  _adService.showAdAndNavigate(context, (){
                    context.go('/home/chooseDrawType', extra: item);
                  });

                });

              },
              onTapMore: () {},
              category: "people",
            ),

            DrawCategoryItem(
              title: "Buildings",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  _adService.showAdAndNavigate(context, (){
                    context.go('/home/chooseDrawType', extra: item);
                  });

                });

              },
              onTapMore: () {},
              category: "buildings",
            ),

            DrawCategoryItem(
              title: "Fashion",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  _adService.showAdAndNavigate(context, (){
                    context.go('/home/chooseDrawType', extra: item);
                  });

                });

              },
              onTapMore: () {},
              category: "fashion",
            ),

            DrawCategoryItem(
              title: "Anime",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  _adService.showAdAndNavigate(context, (){
                    context.go('/home/chooseDrawType', extra: item);
                  });


                });

              },
              onTapMore: () {},
              category: "anime",
            ),

            DrawCategoryItem(
              title: "Cartoons",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  _adService.showAdAndNavigate(context, (){
                    context.go('/home/chooseDrawType', extra: item);
                  });

                });
              },
              onTapMore: () {},
              category: "cartoons",
            ),

            DrawCategoryItem(
              title: "Fantasy",
              onTapItem: (item) {
                _buildCustomDialog(context, (){

                  _adService.showAdAndNavigate(context, (){
                    context.go('/home/chooseDrawType', extra: item);
                  });

                });
              },
              onTapMore: () {},
              category: "fantasy",
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildCustomDialog(
      BuildContext context,
      Function onTapWatchAd,
      ) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 8), // yatay padding
        child: RemoveAdsDialog(
          onTapRemoveAds: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubscriptionSelectionView(),
              ),
            );
          },
          onTapWatchAds: () {
            onTapWatchAd();
          },
        ),
      ),
    );
  }
}
