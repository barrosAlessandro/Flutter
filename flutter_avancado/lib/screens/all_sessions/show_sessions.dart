
import 'package:flutter/material.dart';
import 'package:flutter_avancado/screens/all_sessions/components/session_card.dart';
import 'package:flutter_avancado/screens/session_create/create_sessions.dart';
import 'package:flutter_avancado/utils/constants.dart';

class ShowSessions extends StatefulWidget{
  final dataMeeting;
  const ShowSessions({Key? key, required this.dataMeeting}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShowSessions();
  }
}

class _ShowSessions extends State<ShowSessions>{
  @override
  Widget build(BuildContext context) {
    var dataMeeting = widget.dataMeeting;

    return Scaffold(
      appBar: AppBar(
        title: Text(dataMeeting.title , style: const TextStyle(color: kPrimaryColor, fontSize: 25.0)),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(color: kPrimaryColor),
      ),

      body: dataMeeting.sessions.length>0 ? ListSessions(dataMeeting: dataMeeting) : const BlankSessions(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateSessions())
                    );
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),

    );
  }
}


class BlankSessions extends StatelessWidget{
  const BlankSessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.sentiment_dissatisfied, color: Colors.grey, size: 40,),
          Text('There is no sessions.', style: TextStyle(color: Colors.grey, fontSize: 17, fontWeight: FontWeight.w500)),
          Text('Create one by clicking in + button.', style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }
}

class ListSessions extends StatelessWidget{
  final dataMeeting;
  const ListSessions({Key? key, required this.dataMeeting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataMeeting.sessions.length,
      itemBuilder: (BuildContext context, int index){
        final item = dataMeeting.sessions[index];
        return SessionCard(dataSession: item);
      },
      
    );
  }
  
}