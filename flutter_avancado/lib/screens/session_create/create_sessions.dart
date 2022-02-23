// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_avancado/screens/session_create/components/colors_sessions.dart';
import 'package:flutter_avancado/utils/constants.dart';
import 'package:localization/localization.dart';

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
        title: Text('create-session'.i18n() , style: TextStyle(color: kPrimaryColor, fontSize: 25.0)),
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        actions: 
          <Widget>[
            IconButton(
              icon: const Icon(Icons.done, color: Colors.green),
              tooltip: 'Notifications',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('function-not-implemented'.i18n())));
              },
            )
          ],
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

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          width: screenSize.width - 100,
          // height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(fontSize: 18),
                cursorColor: Colors.grey,        
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)
                  ),
                  labelText: 'title'.i18n(),
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
                    labelText: 'description'.i18n(),
                    
                    floatingLabelStyle: TextStyle(color: kPrimaryColor)
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Text('select-color'.i18n(), style: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontWeight: FontWeight.bold, fontSize: 18)),
              ),

              SetColor()
            ],
          ),
        ),

      ),
    );
  }
}

class SetColor extends StatefulWidget{
  const SetColor({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SetColor();
  }
}

class _SetColor extends State<SetColor>{
  int selectedColor = -1;

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,              
      gridDelegate: 
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 10, childAspectRatio: 1),
      padding: const EdgeInsets.only(top: 20),
      itemCount: colorsList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap:(){
            setState(() {
              selectedColor = index;
              
            });
          },
          child: Container(
            child: selectedColor == index ? Icon(Icons.check_circle_rounded, size: 32) : null,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorsList[index].color
            ),
          ),
        );
      }
    );
  }
}