import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/continue_button.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF8),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset("assets/images/no_connection_internet.png",width: 300, height: 250,),
             SizedBox(height: 16),
             Text("NO Internet Connection!",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF50C4ED)
              )
             ),

            Text("The connection seems to be lost.\nYou can turn on Wi-Fi or mobile\ndata and try again.",
                style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 16,
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF50C4ED)
                ),
              textAlign: TextAlign.center
            ),
            SizedBox(height: 32),
            ContinueButton(
              title: "Retray",
              onPressButton: (){

              },
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF50C4ED),
              widthButton: double.infinity,
            )

          ],
        ),
      ),
    );


  }
}
