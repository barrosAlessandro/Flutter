import 'package:flutter/material.dart';
import 'package:flutter_avancado/main.dart';
import 'package:flutter_avancado/screens/meetings/components/meeting_card.dart';
import 'package:flutter_avancado/utils/constants.dart';
import 'package:flutter_avancado/web_service/meetings_request.dart';
import 'package:localization/localization.dart';

class Meetings extends StatefulWidget{
  const Meetings({Key? key}) : super(key: key);


  @override
  State<Meetings> createState() {
    return _Meetings();
  }
}

class _Meetings extends State<Meetings>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meetings'.i18n(), style: const TextStyle(color: kPrimaryColor, fontSize: 25.0),),
        centerTitle: true,
        leading: const Icon(Icons.menu_outlined, color: kPrimaryColor),
        actions: 
          <Widget>[
            IconButton(
              icon: const Icon(Icons.translate, color: Color.fromARGB(255, 141, 139, 139)),
              tooltip: 'toggle-language'.i18n(),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('function-not-implemented'.i18n())));
                
              },
            )
          ],
        backgroundColor: kWhiteColor,
      ),

      body: FutureBuilder(
        future: getMeetingsData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return BodyMeetings(meetingsList: snapshot.data!,);
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        }
      )
    );

  }
}



class BodyMeetings extends StatelessWidget{
  final meetingsList;
  const BodyMeetings({Key? key, required this.meetingsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20.0),
            child: Text("recents".i18n(), style: TextStyle(color: Color(0xFF8b8b8b), fontSize: 18.0, fontWeight: FontWeight.w500))
          ),

          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index){
              final item = meetingsList[0];
              return MeetingCard(dataMeeting: item, isRecent: true);
            },
          ),

          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20.0),
            child: Text("older".i18n(), style: TextStyle(color: Color(0xFF8b8b8b), fontSize: 18.0, fontWeight: FontWeight.w500))
          ),

          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: meetingsList.length - 1,
            itemBuilder: (BuildContext context, int index){
              final item = meetingsList[index + 1];
              return MeetingCard(dataMeeting: item, isRecent: false,);
            },
          )
        ],
      )
    );
    
  }

  
}