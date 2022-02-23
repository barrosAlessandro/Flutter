import 'package:flutter/material.dart';
import 'package:flutter_avancado/screens/meetings/meetings.dart';
import 'package:flutter_avancado/screens/splash_screen/splash_screen.dart';
import 'package:flutter_avancado/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';


void main() {
  runApp(StickySessionApp());
}

class StickySessionApp extends StatefulWidget {
  StickySessionApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) async {
    _StickySessionAppState? state = context.findAncestorStateOfType<_StickySessionAppState>();
      state?.changeLanguage(newLocale);
  }

  @override
   _StickySessionAppState createState() => _StickySessionAppState();

}

class _StickySessionAppState extends State<StickySessionApp> {
  Locale _locale = Locale('en','US');

   changeLanguage(Locale locale) {
     setState(() {
      _locale = locale;
     });
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: const Locale('en','US'),
      // locale: const Locale('pt','BR'),
      locale: _locale,
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
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => SplashScreen(),

      },

      // home: Meetings(),

    );
  }
}
