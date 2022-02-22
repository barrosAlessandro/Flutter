
import 'package:flutter/material.dart';

class Columns{
  Tab tab;
  String name;
  int color;
  List stickies;

  Columns(this.tab, this.name, this.color, this.stickies);

}


List<Columns> createList(dataSession){
  Tab tab;
  String name;
  int color;
  List stickies;
  List<Columns> tabs = [];

  for (var i = 0; i < dataSession.columns.length; i++) {
    name = dataSession.columns[i].name;
    color = int.parse(dataSession.columns[i].color, radix: 16) + 0xFF000000;
    stickies = 
      dataSession.stickies.where((sticky) => sticky.columnName.toUpperCase() == dataSession.columns[i].name.toUpperCase()).toList();
    tab = createTab(dataSession.columns[i].name, stickies.length);

    tabs.add(Columns(tab, name, color, stickies));
  }

  return tabs;
}


Tab createTab(String name, int number){
  return 
    Tab(child: Row(children: [Text(name.toUpperCase()), const SizedBox(width: 4), Text(number.toString())]));
}


