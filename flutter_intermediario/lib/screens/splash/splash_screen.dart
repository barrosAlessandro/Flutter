// import 'dart:async';
//
// import 'package:challenge_ui_plant_app/screens/home/home_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
//
// class splashScreen extends StatefulWidget {
//   const splashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }
//
// class _splashScreenState extends State<splashScreen> {
//   Future<void> waitSomeSeconds() async =>
//       await Future.delayed(const Duration(seconds: 2), () { });
//
//   @override
//   Widget build(BuildContext context) {
//     goToHome()async{
//       await Future.delayed(const Duration(milliseconds: 2500), (){
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//       });
//     }
//
//     goToHome();
//
//     return const Material(
//       textStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 50, fontWeight: FontWeight.w600),
//       color: kPrimaryColor,
//       child: Center(
//         child: Text('FLUTTER\nPLANT\nAPP UI',
//           textAlign: TextAlign.center),
//         ),
//       );
//
//     //
//     // return FutureBuilder(
//     //     future: waitSomeSeconds(),
//     //     initialData: splashScreenDesign(),
//     //     builder: (BuildContext context, AsyncSnapshot<void> snapshot){
//     //       if(snapshot.hasData){
//     //         return splashScreenDesign();
//     //       }
//     //       else{
//     //         return HomeScreen();
//     //       }
//     // }
//     // );
//
//   }
// }
//
// class splashScreenDesign extends StatelessWidget{
//   const splashScreenDesign({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Material(
//       textStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 50, fontWeight: FontWeight.w600),
//       color: kPrimaryColor,
//       child: Center(
//         child: Text('FLUTTER\nPLANT\nAPP UI',
//           textAlign: TextAlign.center),
//         ),
//       );
//   }
//
// }
//
//
//
