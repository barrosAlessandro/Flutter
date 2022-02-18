import 'package:flutter/material.dart';
import 'package:flutter_avancado/screens/all_sessions/show_sessions.dart';
import 'package:flutter_avancado/screens/meetings/meetings.dart';
import 'package:flutter_avancado/utils/constants.dart';



void main() {
  runApp(const PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sticky Session App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      initialRoute: '/meetings',
      routes: {
        '/meetings' : (context) => Meetings(),
        // '/show_sessions' : (context) => ShowSessions(dataMeeting: null,),
      //   '/splash_screen': (context) => splashScreen(),
      //   '/home': (context) => HomeScreen(),
      //   '/detail_plant': (context) => PlantDetailBody(dataPlant: null,),
      },
      // home: const HomeScreen(),
    );
  }
}
