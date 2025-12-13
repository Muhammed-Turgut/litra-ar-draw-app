import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          )
        ],
      ),
    );
  }
}
