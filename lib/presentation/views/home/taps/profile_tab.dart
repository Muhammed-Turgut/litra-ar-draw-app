import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litra_ar_draw_app/presentation/widgets/profile/profile_continue_button.dart';
import 'package:litra_ar_draw_app/presentation/widgets/profile/profile_info.dart';

class ProfileTab extends StatelessWidget {

  final VoidCallback onTap;

  ProfileTab({required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF8),
      body: SafeArea(
          bottom: true,
          top: true,
          child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            _buildTopBar((){
              onTap();
            }),
            _buildContentBar()

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
      children: [

      ],
    );
  }
}
