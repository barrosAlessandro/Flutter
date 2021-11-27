import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/screens/detail/plant_detail_screen.dart';
import 'package:flutter/material.dart';

class RecomendedPlanCard extends StatelessWidget {
  final dataPlant;
  const RecomendedPlanCard({
    Key? key,
    required this.dataPlant
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Card(
            child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlantDetailScreen(dataPlant: dataPlant)
                      )
                  );
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: screenSize.height * 0.22,
                        child: FittedBox(
                            child: Image.network(dataPlant.image.substring(0, dataPlant.image.indexOf('resize=')) + 'resize=*:300'),
                            fit: BoxFit.cover,
                            clipBehavior: Clip.hardEdge
                        )
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 8.0,right: 8.0, bottom: 3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Flexible(
                                  child: Text(dataPlant.name.toUpperCase(), style: Theme.of(context).textTheme.button,
                                    maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  )
                              ),
                              Text('\$${dataPlant.price}', style: Theme.of(context).textTheme.button!.copyWith(color: kPrimaryColor))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(dataPlant.country.toUpperCase(), style: TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                          ),
                        )
                      ],
                    ),
                  ],
                )
            )
        ),

        Positioned(
          right: 5.0,
          top: 4.0,
          // child: FloatingActionButton(
          //   child: const Icon(Icons.favorite_outlined),
          //   backgroundColor: Colors.transparent,
          //   foregroundColor: Colors.red,
          //   onPressed: () {
          //     setState(){
          //       foregroundColor: Colors.white;
          //     }
          //   },
          // ),
          child: IconButton(
            icon: const Icon(Icons.favorite_outlined),
            onPressed: () {
              setState(){
                icon: const Icon(Icons.ac_unit_sharp);
              }
            }
          ),
          )
      ],
    );
  }
}

