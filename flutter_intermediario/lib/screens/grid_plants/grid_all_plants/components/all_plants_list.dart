
import 'package:challenge_ui_plant_app/screens/grid_plants/grid_all_plants/components/all_plants_card.dart';
import 'package:challenge_ui_plant_app/screens/home/components/recommend_plan_card.dart';
import 'package:challenge_ui_plant_app/web_service/info_plants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AllPlantsList extends StatelessWidget{
  final plantsList;
  const AllPlantsList({Key? key, required this.plantsList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5,
          mainAxisSpacing: 10, childAspectRatio: ((screenSize.width * 0.4) / (screenSize.width * 0.7) )),
        padding: const EdgeInsets.all(10.0),
        itemCount: plantsList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = plantsList[plantsList.length - 1 - index];
          return AllPlantsCard(dataPlant: item,);
        }
    );
  }


}

