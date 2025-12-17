import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:litra_ar_draw_app/presentation/view_models/explore_view_model.dart';
import 'package:litra_ar_draw_app/presentation/widgets/profile/profile_continue_button.dart';
import 'package:litra_ar_draw_app/presentation/widgets/profile/profile_info.dart';
import 'package:provider/provider.dart' show Consumer;


class ProfileTab extends StatelessWidget {

  final VoidCallback goLevel;
  final VoidCallback goSharePost;

  ProfileTab({required this.goLevel, required this.goSharePost});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF8),
      body: SafeArea(
          bottom: true,
          top: true,
          child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            _buildTopBar((){
              goLevel();
            }),
            SizedBox(height: 16,),
            _buildContentBar(),

            SizedBox(
              height: 16,
            ),

            Padding(
              padding:EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("My Gallery",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  _buildUploadImageAre(context, (){
                    goSharePost();
                  })
                ],
              ),
            ),

            SizedBox(height: 16),

            Padding(padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("About App",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(onTap: (){
                            _openUrl("https://github.com/muhammed-turgut");
                          },
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("About Developer",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                              SvgPicture.asset("assets/icons/chevron_right_icon.svg",
                                 width: 24,
                                 height: 24,
                                 colorFilter: ColorFilter.mode(Color(0xFFB0B0B0),BlendMode.srcIn),
                               )
                            ],
                            )
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: (){
                              _openUrl("https://muhammedtturgut.blogspot.com/2024/10/gizlilik-politikas-metni.html");

                            },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Privacy policy",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                               SvgPicture.asset("assets/icons/chevron_right_icon.svg",
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(Color(0xFFB0B0B0),BlendMode.srcIn),
                                )
                            ],
                          ),
                          )
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                        color: Color(0xFFF5F5F5),
                        width: 2,
                      )
                    ),
                  )
                ],
              ))



          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(Function onTap) {
    // Widget'ın tamamının yüksekliğini ve dekorasyonunu belirten ana Container.
    return Container(
      height: 160,
      decoration: const BoxDecoration( // const eklendi
        color: Color(0xFF50C4ED),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          // Arka plan SVG resmi
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/images/backgroun_materyal.svg",
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ),
          // İçerik (Logo, Başlık, Profil Bilgileri, Buton)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Dikey boşluk da eklendi
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 1. Satır: Uygulama Logosu ve Adı
                Row(
                  children: [
                    Image.asset(
                      "assets/images/app_logo.png",
                      width: 36,
                      height: 32,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Litra: AR Draw",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // 2. Satır: Kullanıcı Bilgileri ve Buton
                Expanded( // Kalan alanı doldurmak ve hizalamayı kolaylaştırmak için
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // Ortalamak için
                    children: [

                      ProfileInfo(level: "seed", fullName: "Muhammed Turgut"), // Profil bilgileri için yeni bir widget
                      const Spacer(), // Kullanıcı bilgileri ve buton arasına maksimum boşluk koyar
                      ProfileContinueButton(onPress:(){
                        onTap(); //navigasyon işlemi için
                        }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         _buildItem(Color(0xFFFBA834),"drawing","1","draw_paintbrush_icon.svg"),
         _buildItem(Color(0xFFFBDF32),"Clock","14s","clock_square_icon.svg"),
         _buildItem(Color(0xFFE946EA),"Share","4","share_arrow_icon.svg"),

      ],
    );
  }

 Widget _buildItem(Color color, String title, String content,String icon) {

    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: Color(0xFFF5F5F5),
          width: 2,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset("assets/icons/$icon",width: 48, height: 48,)
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
            ),
           SizedBox(height: 8,),
            Text(title,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w300,
                fontSize: 10
              ),
            ),

            Text(content,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              ),
            )
          ],
        ),
      ),
    );

 }

  Widget _buildUploadImageAre(BuildContext context, Function function) {

    return Consumer<ExploreViewModel>(builder: (context,viewModel,child){
      return SizedBox(
          width: double.infinity,
          height: 138,
          child: GestureDetector(onTap:() {
            function();
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

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      debugPrint("Link açılamadı: $url");
    }
  }
}

