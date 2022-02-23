import 'package:flutter/material.dart';
import 'package:flutter_avancado/screens/meetings/meetings.dart';
import 'package:flutter_avancado/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';


void main() {
  runApp(const StickySessionApp());
}

class StickySessionApp extends StatefulWidget {
  const StickySessionApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StickySessionAppState();
  }
}

class _StickySessionAppState extends State<StickySessionApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en','US'),
      // locale: const Locale('pt','BR'),

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR')
      ],
      title: 'Sticky Session App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),

      home: const Meetings(),

    );
  }
}
