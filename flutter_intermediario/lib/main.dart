import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/screens/detail/components/plant_detail_body.dart';
import 'package:challenge_ui_plant_app/screens/grid_plants/grid_plants.dart';
import 'package:challenge_ui_plant_app/screens/home/home_screen.dart';
import 'package:challenge_ui_plant_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      initialRoute: '/splash_screen',
      routes: {
        '/grid_plants' : (context) => GridPlants(),
        '/splash_screen': (context) => splashScreen(),
        '/home': (context) => HomeScreen(),
        '/detail_plant': (context) => PlantDetailBody(dataPlant: null,),
      },
      // home: const HomeScreen(),
    );
  }
}
