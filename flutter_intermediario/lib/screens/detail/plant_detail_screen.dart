import 'package:challenge_ui_plant_app/screens/detail/components/plant_detail_body.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class PlantDetailScreen extends StatelessWidget {
  final dataPlant;
  const PlantDetailScreen({Key? key, required this.dataPlant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.grey,
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        child: const Icon(Icons.arrow_back_outlined),
        // backgroundColor: Colors.white70,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: PlantDetailBody(
          dataPlant: dataPlant
      ),
    );
  }
}