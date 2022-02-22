
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_avancado/screens/notes_create/notes_create.dart';
import 'package:flutter_avancado/screens/session_view/components/list_of_tabs.dart';
import 'package:flutter_avancado/screens/session_view/components/sticky_card.dart';
import 'package:flutter_avancado/utils/constants.dart';


class SessionView extends StatefulWidget{
  final dataSession;
  const SessionView({Key? key, required this.dataSession}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SessionView();
  }
}

class _SessionView extends State<SessionView>{
  @override
  Widget build(BuildContext context) {
    var dataSession = widget.dataSession;
    int lengthTabBar = dataSession.columns.length;
    List<Columns> tabs = createList(dataSession);
    
    List<StatelessWidget> bodyColumnsList = [];
    for (var i = 0; i < lengthTabBar; i++) {
      bodyColumnsList.add(BodySessionView(dataTab: tabs[i]));
    }


    return DefaultTabController(
      initialIndex: 1,
      length: dataSession.columns.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(dataSession.name , style: const TextStyle(color: kPrimaryColor, fontSize: 25.0)),
          centerTitle: true,
          backgroundColor: kWhiteColor,
          iconTheme: const IconThemeData(color: kPrimaryColor),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 30),
              indicatorColor: Colors.green,
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              isScrollable: true,
              unselectedLabelColor: Colors.grey.withOpacity(0.7),
              labelColor: Colors.green,          
              tabs: tabs.map((e) => e.tab).toList()

            ),
          ),
        ),

        body: TabBarView(
          children: bodyColumnsList
        ),      
      ),
    );
  }
}


class BodySessionView extends StatelessWidget{
  final dataTab;
  const BodySessionView({Key? key, required this.dataTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNotes()
                    )
                ),
            
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: screenSize.width*0.8,
              height: 50, 
              color: Color.fromARGB(255, 216, 215, 215),
              child: Center(child: Text('+ NEW NOTE', style: TextStyle(color: Color.fromARGB(255, 126, 125, 125), fontWeight: FontWeight.bold, fontSize: 15),)),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataTab.stickies.length,
            itemBuilder: (BuildContext context, int index) { 
              final item = dataTab.stickies[index];
              return StickyCard(dataSticky: item, color: dataTab.color,);
            },          
          )
        ],
      ),
    );
  }


}