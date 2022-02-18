import 'package:flutter/material.dart';
import 'package:flutter_avancado/utils/constants.dart';

class SessionCard extends StatelessWidget{
  final dataSession;
  const SessionCard({Key? key, required this.dataSession}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardHeight = 170.0;
    int cardColor = int.parse(dataSession.highlight, radix: 16) + 0xFF000000;
    Size screenSize = MediaQuery.of(context).size;


    return GestureDetector(

      child: Container(
        height: cardHeight,
        width: double.infinity,
        color: kWhiteColor, 
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: cardHeight,
              width: 11.0,
              color: Color(cardColor),
            ),

            Container(
              padding: const EdgeInsets.only(top: 15.0, left: 15.0),
              width: screenSize.width - 50,
              height: cardHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dataSession.name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 21)),
                  
                  const SizedBox(height: 15),
               
                  Text(dataSession.description, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15), overflow: TextOverflow.clip,),
                  
                  const SizedBox(height: 30),
                  
                  Row(children: const [
                        Icon(Icons.people_alt_rounded, color: kPrimaryColor, size: 18),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('8 Responses', style: TextStyle(color:kPrimaryColor, fontWeight: FontWeight.w400, fontSize: 16)),
                        ),
                      ],
                  )
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