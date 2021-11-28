import 'package:challenge_ui_plant_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantDetailBody extends StatelessWidget {
  final dataPlant;
  const PlantDetailBody({Key? key, required this.dataPlant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kBackgroundColor,
      child: Column(

        children: [
          Row(
            children: [
              Expanded(
                child: Column()
              ),
              Container(
                height: size.height * 0.6,
                width: size.width * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(63),
                    bottomLeft: Radius.circular(63)
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 60,
                      color: kPrimaryColor.withOpacity(0.29)
                    )
                  ],
                  image: DecorationImage(
                    image: NetworkImage(dataPlant.image.substring(0, dataPlant.image.indexOf('resize=')) + 'resize=500:*'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),


          SizedBox(
              width: size.width,
              height: size.height * 0.4 - 100,
              child: Container(
                padding: const EdgeInsets.only(left: 13.0, right: 14.0, top: 5.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(dataPlant.name, style: Theme.of(context).textTheme.headline4)
                    ),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${dataPlant.country.toUpperCase()}   |  Carelevel: ${dataPlant.carelevel}',
                          style: const TextStyle(fontSize: 16, color: kPrimaryColor)
                        )
                    ),
                    Expanded(

                        child: SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 8.00),
                            child: Text(dataPlant.description,
                                style: const TextStyle(fontSize: 16, color: kPrimaryColor),
                                textAlign: TextAlign.justify
                            )
                        )

                    )
                  ],
                ),

              )
          ),

          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: ElevatedButton(
                  child: const Text("Buy Now"),
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20)
                          )
                      )
                  ),
                  onPressed: () {
                    const snackBar = SnackBar(
                        content: Text('Funcionalidade de compra não foi implementada')
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.only(right: 14.0),
                child: Material(
                  child: Text('\$${dataPlant.price}',
                      style: const TextStyle(fontSize: 24, color: kPrimaryColor)
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}