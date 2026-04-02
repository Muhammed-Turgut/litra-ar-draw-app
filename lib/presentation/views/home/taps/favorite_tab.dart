import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {


  BannerAd? myBanner;

  bool _isBannerLoaded = false;


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
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF8),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text("Favorites", style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500
            ),
            ),
          ],),

          SizedBox(height: 24,),
          Expanded(
            child: Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(children: [
                    Image.asset("assets/images/no_connection_internet.png",
                      width: 300,
                      height: 240,),
                    SizedBox(height: 20,),
                    Text("There's nothing to\nshow here.", style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 1
                    ),
                      textAlign: TextAlign.center,
                    )
                    ],
                  ),

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
                        )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
