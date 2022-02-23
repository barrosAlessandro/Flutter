import 'package:flutter/material.dart';
import 'package:flutter_avancado/main.dart';
import 'package:flutter_avancado/screens/all_sessions/show_sessions.dart';
import 'package:flutter_avancado/utils/constants.dart';
import 'package:localization/localization.dart';

class MeetingCard extends StatelessWidget{
  final dataMeeting;
  final bool isRecent;
  const MeetingCard({Key? key, required this.dataMeeting, required this.isRecent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowSessions(dataMeeting: dataMeeting,)
                    )
                ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
        height: 250.0,
        width: double.infinity,
        color: isRecent ? kPurpleColor : kWhiteColor, 
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dataMeeting.title, style: TextStyle(color: isRecent ? const Color(0xFFe6dee6) : Colors.black, fontWeight: FontWeight.w500, fontSize: 25)),
            
            const SizedBox(height: 12),
            
            Text('${dataMeeting.local}    |    ${dataMeeting.startDate}', style: TextStyle(color: isRecent ? const Color(0xFFe6dee6) : Colors.black, fontWeight: FontWeight.w400, fontSize: 18)),
            
            const SizedBox(height: 12),
            
            Text(dataMeeting.description, style: TextStyle(color: isRecent ? const Color(0xFFb096ae) : Colors.grey, fontWeight: FontWeight.w400, fontSize: 15)),
            
            const SizedBox(height: 12),
            
            Row(children: [
                  Icon(Icons.article_rounded, color: isRecent ? const Color(0xFFe6dee6) : kPrimaryColor, size: 18),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(dataMeeting.sessions.length.toString(), style: TextStyle(color: isRecent ? const Color(0xFFe6dee6) : kPrimaryColor, fontWeight: FontWeight.w400, fontSize: 16)),
                  ),
                ],
            ),
            
            const SizedBox(height: 12),
            
            Row(children: [
                  Icon(Icons.people_alt_rounded, color: isRecent ? const Color(0xFFe6dee6) : kPrimaryColor, size: 18),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('8 ' + 'participants'.i18n(), style: TextStyle(color: isRecent ? const Color(0xFFe6dee6) : kPrimaryColor, fontWeight: FontWeight.w400, fontSize: 16)),
                  ),
                ],
            )
          ],
        ),
      )
      

    );


  }

  
}
