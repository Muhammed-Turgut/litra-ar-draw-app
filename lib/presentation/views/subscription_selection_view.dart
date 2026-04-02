import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/continue_button.dart'
    show ContinueButton;

class SubscriptionSelectionView extends StatelessWidget {
  const SubscriptionSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          height: 240,
          // ✅ istediğiniz yüksekliği buraya yazın (300, 400, 500 deneyin)
          decoration: BoxDecoration(
            color: Color(0xFF50C4ED),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Arka plan SVG — tüm Container'ı kaplar
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/images/backgroun_materyal.svg",
                        fit: BoxFit.contain,
                      ),

                      SvgPicture.asset(
                        "assets/images/backgroun_materyal.svg",
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),

              // İçerik
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            "assets/icons/chevron_left_icon.svg",
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        )

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 48),
                      child: Column(
                        children: [
                          Text(
                            "Litra: AR Draw",
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Hayal Gücünün Sınırlama,\nSanatını Profesyonelece Konuştur",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      border: Border.all(color: Color(0xFFFDD34D), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yıllık Plan",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF03324C),
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "399.99 TL/yılık",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF50C4ED),
                                  height: 1,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "718 TL",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  height: 1,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFEFE0),
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: Text(
                                  "% 55 Tasarruf",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF894D00),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// 🔥 POPÜLER BADGE
                  Positioned(
                    top: -12,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFFDD34D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "En Popüler",
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF50C4ED).withAlpha(25),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: Color(0xFF50C4ED)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aylık Plan",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF03324C),
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 8),

                      Text(
                        "59.99 TL",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF50C4ED),
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              ContinueButton(
                title: "Aboneliği Başlat",
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF50C4ED),
                onPressButton: () {},
                widthButton: 380,
              ),

              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Kullanım koşulları",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8DB1D1),
                      height: 1,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(width: 8),

                  Text(
                    "Gizlilik Politikası",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8DB1D1),
                      height: 1,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
