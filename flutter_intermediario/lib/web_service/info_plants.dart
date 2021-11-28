import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:challenge_ui_plant_app/models/model_info_plants.dart';
import 'package:challenge_ui_plant_app/providers/db_provider.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;


Future<List<InfoPlants>> getPlantsData() async {
  const r = RetryOptions(maxAttempts: 4);
  final response = await r.retry(
        () => http.get(Uri.parse('https://study-web-app.herokuapp.com/plants')).timeout(const Duration(seconds: 6)),
    // Retry on SocketException or TimeoutException
    retryIf: (e) => e is SocketException || e is TimeoutException,
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> responseData = jsonDecode(response.body);
    List<InfoPlants> plantsList = responseData
        .map(
          (dynamic item) {
            DBProvider.db.createInfoPlants(InfoPlants.fromJson(item));
            return InfoPlants.fromJson(item);
          }
    )
        .toList();

    return plantsList;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// import 'package:challenge_ui_plant_app/models/model_info_plants.dart';
// import 'package:challenge_ui_plant_app/providers/db_provider.dart';
// import 'package:dio/dio.dart';
//
//
// class EmployeeApiProvider {
//   Future<List<InfoPlants>> getAllInfoPlants() async {
//     var url = "http://demo8161595.mockable.io/employee";
//     Response response = await Dio().get(url);
//
//     return (response.data as List).map((infoPLants) {
//       print('Inserting $infoPLants');
//       DBProvider.db.createInfoPlants(InfoPlants.fromJson(infoPLants));
//     }).toList();
//   }
// }

