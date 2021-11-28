import 'package:flutter/cupertino.dart';

class AppControler extends ChangeNotifier{
  static AppControler instance = AppControler();

  updatePage(){
    notifyListeners();
  }
}