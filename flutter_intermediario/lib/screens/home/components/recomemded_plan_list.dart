import 'package:challenge_ui_plant_app/screens/detail/components/plant_detail_body.dart';
import 'package:challenge_ui_plant_app/web_service/info_plants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'recommend_plan_card.dart';
import 'package:challenge_ui_plant_app/utils/utils.dart';


class RecomemdedPlantList extends StatelessWidget {
  const RecomemdedPlantList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadOnlineCards();

  }
}


class LoadOnlineCards extends StatefulWidget{
  const LoadOnlineCards({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadOnlineCardsState();

}

class _LoadOnlineCardsState extends State<LoadOnlineCards>{
  late Future<List<InfoPlants>> futureList;


  @override
  void initState() {
    super.initState();
    futureList = getPlantsData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureList,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListRecommendedCards(plantsList: snapshot.data!);
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        }
    );
  }
}

class ListRecommendedCards extends StatelessWidget{
  final plantsList;
  const ListRecommendedCards({Key? key, required this.plantsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 285,
      child: ListView.builder(
        cacheExtent: double.infinity,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index){
            final item = plantsList[Utils.generateRandomIndex(plantsList.length)];
            return SizedBox(
              width: 190,
              height: 200,
              child: RecomendedPlanCard(
                    dataPlant: item
              ),
            );
          },
      ),
    );
  }
}

