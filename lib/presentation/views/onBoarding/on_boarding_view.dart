import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/presentation/widgets/common/custom_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});


  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final List<OnBoardingItem> _onBoardingPageItem = [
    OnBoardingItem(
      image: "assets/images/on_boarding_start_image.png",
      title: "Gerçek Dünyada Çizmeye\nBaşla",
      explanation: "Telefon kameranı kullanarak çizimlerini\ngerçek mekâna taşı\n. AR ile çizim yapmak artık çok daha\nkolay ve eğlenceli.",
      pageNumber: 1
    ),
    OnBoardingItem(
        image: "assets/images/on_boarding_midel_image.png",
        title: "Kılavuz Çizgilerle Daha\nDoğru Çiz",
        explanation: "Uygulama, adım adım çizmen için sana rehber çizgiler sunar. İster basit ister detaylı çizimler yap.",
        pageNumber: 2
    ),
    OnBoardingItem(
        image: "assets/images/on_boarding_finish_image.png",
        title: "Kaydet, Paylaş ve İlham Ver",
        explanation: "Yaptığın AR çizimleri kaydedebilir ve\narkadaşlarınla hemen paylaşabilirsin.\nYaratıcılığını herkese göster!",
        pageNumber: 3
    ),
  ];

   int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          top: true,
          bottom: true,
          child: _buildBody()
      ) ,
    );
  }

  Widget _buildBody() {
    return Container(
         child: Column(
            children: [
              _buildImageFiled(_onBoardingPageItem[_selectedPage].image),
              _buildContentField(_onBoardingPageItem[_selectedPage].title, _onBoardingPageItem[_selectedPage].explanation, _selectedPage)
            ],
         ),
      );
  }

  Widget _buildImageFiled(String image) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF50C4ED),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64),bottomRight: Radius.circular(64)),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(child: SvgPicture.asset("assets/images/backgroun_materyal.svg",width: 412,height: 215,)),
                Expanded(child: SvgPicture.asset("assets/images/backgroun_materyal.svg",width: 412,height: 215,)),
                Expanded(child: SvgPicture.asset("assets/images/backgroun_materyal.svg",width: 412,height: 215,)),
                Expanded(child: SvgPicture.asset("assets/images/backgroun_materyal.svg",width: 412,height: 215,)),
              ],
            ),
          ),

          Image.asset(image,width: double.infinity, height: 520,fit: BoxFit.cover, ),

          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min, // <-- önemli
                children: [
                  Container(width: _selectedPage == 0 ? 36 : 18, height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                   ),
                  ),
                  SizedBox(width: 8),
                  Container(width: _selectedPage == 1 ? 36 : 18, height: 12,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(width: _selectedPage == 2 ? 36 : 18 , height: 12,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget _buildContentField(String title, String explanation, int pageNumber) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 28, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    color: Color(0xFF50C4ED),
                    height: 1.2,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 12),
              Text(explanation,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFC8C8C8),
                    fontFamily: 'Outfit',
                    height: 1.1,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 24),
              if( _selectedPage == 0)
                CustomButton(
                  title: "Devam et",
                  onPressButton: (){
                    setState(() {
                      _selectedPage = _selectedPage +1;
                    });
                  },
                  backgroundColor: Color(0xFF50C4ED),
                  foregroundColor: Colors.white,
                  widthButton: 380,
                )
              else if(_selectedPage == 1 || _selectedPage == 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     CustomButton(
                        title: "önceki",
                        onPressButton: (){
                          setState(() {
                            _selectedPage = _selectedPage - 1; // <-- İŞLEV EKLENDİ
                          });
                        },
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF50C4ED),
                        borderWidth: 1,
                        icon: "chevron_left_icon.svg",
                        widthButton: 130,
                      ),
                    SizedBox(width: 10),
                     Expanded(
                       child: CustomButton(
                            title: _selectedPage == 2 ? "Başla" : "Devam et",
                            onPressButton: (){
                              // Burada son sayfadan sonra ne yapılacağına karar verilebilir (örneğin ana sayfaya yönlendirme)
                              // Şimdilik sadece sayfa artırma işlevi ekleniyor.

                              if(_selectedPage == 2){
                                context.go('/logIn');
                              }
                              else{
                                setState(() {
                                  _selectedPage = _selectedPage + 1;
                                });
                              }

                            },
                            backgroundColor: Color(0xFF50C4ED),
                            foregroundColor: Colors.white,
                            widthButton: 242,
                          ),
                     )
                  ],
                )

            ],
          ),
        ),
      ),
    );
  }
}


class OnBoardingItem{
  final String image;
  final String title;
  final String explanation;
  final int pageNumber;

  OnBoardingItem({
    Key? key,
    required this.image,
    required this.title,
    required this.explanation,
    required this.pageNumber}
  );

}