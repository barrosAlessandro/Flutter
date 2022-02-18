import 'dart:async';

import 'package:challenge_ui_plant_app/screens/home/home_screen.dart';
import 'package:challenge_ui_plant_app/web_service/info_plants.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';



class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToHome()async{
      getPlantsData();
      await Future.delayed(const Duration(milliseconds: 2500), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }

    goToHome();

    return const Material(
      textStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 50, fontWeight: FontWeight.w600),
      color: kPrimaryColor,
      child: Center(
        child: Text('FLUTTER\nPLANT\nAPP UI',
          textAlign: TextAlign.center),
        ),
      );
  }
}




