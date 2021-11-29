import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/model_info_plants.dart';
import 'package:challenge_ui_plant_app/screens/detail/plant_detail_screen.dart';
import 'package:challenge_ui_plant_app/utils/notify_listeners.dart';
import 'package:flutter/material.dart';
import 'package:challenge_ui_plant_app/providers/db_provider.dart';


class FavoritePlanCard extends StatelessWidget {
  final dataPlant;
  const FavoritePlanCard({
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
                            child: CachedNetworkImage(
                              imageUrl: dataPlant.image.substring(0, dataPlant.image.indexOf('resize=')) + 'resize=*:400',
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
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
          child: IconButton(
              icon: const Icon(Icons.favorite_outlined),
              onPressed: () {
                var item = InfoPlants(
                    id: dataPlant.id,
                    name: dataPlant.name,
                    image: dataPlant.image,
                    description: dataPlant.description,
                    price: dataPlant.price,
                    carelevel: dataPlant.carelevel,
                    country: dataPlant.country);

                DBProvider.db.deleteFromFavoritePlants(dataPlant.id);
                AppControler.instance.updatePage();
              }
          ),
        )
      ],
    );
  }
}

