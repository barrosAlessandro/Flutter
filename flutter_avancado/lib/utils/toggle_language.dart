
import 'package:flutter/material.dart';

class AppControler extends ChangeNotifier{
  static AppControler instance = AppControler();

  updatePage(){
    notifyListeners();
  }
}