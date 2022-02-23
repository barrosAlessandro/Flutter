import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_avancado/screens/meetings/meetings.dart';
import 'package:flutter_avancado/utils/constants.dart';
import 'package:flutter_avancado/web_service/meetings_request.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToHome()async{
      // getMeetingsData();
      await Future.delayed(const Duration(milliseconds: 2500), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Meetings()));
      });
    }

    goToHome();

    return const Material(
      textStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 50, fontWeight: FontWeight.w600),
      color: kPurpleColor,
      child: Center(
        child: Image(image: AssetImage('./assets/images/logo_symbol.png')),
        ),
      );
  }
}




