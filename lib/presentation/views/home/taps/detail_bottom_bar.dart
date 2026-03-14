import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class DetailBottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Draggable Bottom Sheet")),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Text("Ana içerik", style: TextStyle(fontSize: 24)),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            builder: (context,scrollController){
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24))
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(height: 12),

                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            color:Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Center(
                      child: Text("Sürüklenebilir panael", style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 50),

                    ListTile(title: Text("Seçenek 1")),
                    ListTile(title: Text("Seçenek 2")),
                    ListTile(title: Text("Seçenek 3")),
                    ListTile(title: Text("Seçenek 4")),
                    ListTile(title: Text("Seçenek 5")),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
