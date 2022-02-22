
import 'package:flutter/material.dart';

class StickyCard extends StatelessWidget{
  final dataSticky;
  final color;
  const StickyCard({Key? key, required this.dataSticky, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double cardWidth = screenSize.width * 0.8;
    double cardHeight = screenSize.width * 0.8;


    return Align(
      child: Container(
        height: 200,
        width: cardWidth,
        color: Color(color), 
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15.0, left: 15.0),
              width: cardWidth - 50,
              height: cardHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dataSticky.userName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 21)),
                  
                  const SizedBox(height: 15),
               
                  Text(dataSticky.content, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15), overflow: TextOverflow.clip,),
                  
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Icon(Icons.more_vert, size: 25,),
            )
          ],
        ),

      ),
    );

  }
  

}