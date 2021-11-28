import 'package:challenge_ui_plant_app/models/model_info_plants.dart';
import 'package:challenge_ui_plant_app/providers/db_provider.dart';
import 'package:challenge_ui_plant_app/screens/detail/components/plant_detail_body.dart';
import 'package:challenge_ui_plant_app/screens/home/components/favorite_plan_card.dart';
import 'package:challenge_ui_plant_app/utils/notify_listeners.dart';
import 'package:challenge_ui_plant_app/web_service/info_plants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'recommend_plan_card.dart';
import 'package:challenge_ui_plant_app/utils/utils.dart';


class FavoritePlantList extends StatelessWidget {
  const FavoritePlantList({
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
    // getPlantsData();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppControler.instance,
        builder: (context, child){
          return SizedBox(
            width: double.infinity,
            height: 285,
            child: FutureBuilder(
                future: DBProvider.db.getFavoriteInfoPlants(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListFavoriteCards(plantsList: snapshot.data!);
                  }
                  else if(snapshot.hasError){
                    return Text('${snapshot.error}');
                  }
                  return const Center(child: CircularProgressIndicator());
                }
            ),
          );
        }
    );
  }
}

class ListFavoriteCards extends StatelessWidget{
  final plantsList;
  const ListFavoriteCards({Key? key, required this.plantsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        width: double.infinity,
        height: 285,
        child: ListView.builder(
          cacheExtent: double.infinity,
          scrollDirection: Axis.horizontal,
          itemCount: Utils.indexFavorite(plantsList.length),
          itemBuilder: (BuildContext context, int index){
            final item = plantsList[plantsList.length - 1 - index];
            return SizedBox(
              width: 190,
              height: 200,
              child: FavoritePlanCard(
                  dataPlant: item
              ),
            );
          },
        ),
      );
    }




}

