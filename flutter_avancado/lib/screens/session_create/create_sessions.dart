// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avancado/screens/session_create/components/colors_sessions.dart';
import 'package:flutter_avancado/utils/constants.dart';

class CreateSessions extends StatefulWidget{
  const CreateSessions({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateSessions();
  }

  
}

class _CreateSessions extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Session' , style: TextStyle(color: kPrimaryColor, fontSize: 25.0)),
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(color: kPrimaryColor)
      ),

      body: const BodyCreateSessions(),

    );

  }  
}


class BodyCreateSessions extends StatelessWidget{
  const BodyCreateSessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: screenSize.width - 100,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              style: TextStyle(fontSize: 18),
              cursorColor: Colors.grey,        
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)
                ),
                labelText: 'Title',
                floatingLabelStyle: TextStyle(color: kPrimaryColor)
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: TextField(
              style: TextStyle(fontSize: 18),
              maxLines: 5,
                maxLength: 30,
                cursorColor: Colors.grey,        
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)
                  ),
                  labelText: 'Description',
                  
                  floatingLabelStyle: TextStyle(color: kPrimaryColor)
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Text('Select a color', style: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontWeight: FontWeight.bold, fontSize: 18)),
            ),

            GridView.builder(
              
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,              
              gridDelegate: 
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 10, childAspectRatio: 1),
              padding: const EdgeInsets.only(top: 20),
              itemCount: colorsList.length,
              itemBuilder: (BuildContext context, int index) {
                // final item = plantsList[plantsList.length - 1 - index];
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorsList[index].color
                  ),
                );
              }
            )


          ],
        ),
      ),

    );

  }



}