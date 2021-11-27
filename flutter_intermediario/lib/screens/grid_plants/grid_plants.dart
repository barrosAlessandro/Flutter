
import 'package:challenge_ui_plant_app/utils/app_bar.dart';
import 'package:challenge_ui_plant_app/web_service/info_plants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/all_plants_list.dart';

class GridPlants extends StatefulWidget{
  const GridPlants({Key? key}) : super(key: key);


  @override
  State<GridPlants> createState() {
    return _GridPlantsState();
  }

}

class _GridPlantsState extends State<GridPlants> {
  late Future<List<InfoPlants>> futureList;

  @override

  void initState() {
    super.initState();
    futureList = getPlantsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0
      ),
      body: FutureBuilder(

          future: futureList,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return AllPlantsList(plantsList: snapshot.data!);
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }
      ),
    );

  }
}