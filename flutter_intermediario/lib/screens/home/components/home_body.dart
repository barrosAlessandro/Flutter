import 'dart:ffi';

import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/screens/home/components/recommend_plan_card.dart';
import 'package:flutter/material.dart';

import 'favorite_plan_list.dart';
import 'header_with_searchbox.dart';
import 'recomemded_plan_list.dart';
import 'title_with_button_row.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return
    Column(
      children: [
        HeaderWithSearchBox(
            screenSize: screenSize
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleWithButtonRow(
                  title: "Favorite Plants",
                  buttonText: "More",
                  onPressed: () {
                    return Navigator.of(context).pushNamed('/grid_favorite_plants');
                  },
                ),

                const FavoritePlantList(),

                TitleWithButtonRow(
                  title: "All Plants",
                  buttonText: "More",
                  onPressed: () {
                    return Navigator.of(context).pushNamed('/grid_all_plants');
                  },
                ),

                const RecomemdedPlantList(),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
