import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemoveAdsDialog extends StatelessWidget {

  final VoidCallback onTapRemoveAds;
  final VoidCallback onTapWatchAds;

  RemoveAdsDialog({
    required this.onTapRemoveAds,
    required this.onTapWatchAds
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(32)
        ),
        child: Padding(
          padding:  EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              SvgPicture.asset("assets/icons/ad_block_icon.svg"),

              SizedBox(height: 16),

              Text(
                "Remove Ads",
                style: TextStyle(
                  fontSize: 22,
                  height: 1.1,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Don't be distracted by advertisements any longer.",
                style: TextStyle(
                  fontSize: 14,
                  height: 1.1,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),


              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                   onTapWatchAds();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF50C4ED),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100), // isteğe bağlı
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SvgPicture.asset("assets/icons/watch_ad_icon.svg"),

                      Text(
                        "Watch Ad",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
              ),


             SizedBox(
               height: 8,
             ),


              GestureDetector(
                onTap: (){

                  onTapRemoveAds();

                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFDD34D), Color(0xFF50C4ED)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
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

            ],
          ),
        ),
      ),
    );
  }
}
