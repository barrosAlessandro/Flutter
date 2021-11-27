import 'dart:async';
import 'dart:convert';
import 'dart:io';
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
          (dynamic item) => InfoPlants.fromJson(item),
    )
        .toList();

    return plantsList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class InfoPlants {
  final String id;
  final String name;
  final String image;
  final String description;
  final String price;
  final String carelevel;
  final String country;

  InfoPlants({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.carelevel,
    required this.country

  });

  factory InfoPlants.fromJson(Map<String, dynamic> json) {
    return InfoPlants(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        price: json['price'],
        carelevel: json['carelevel'],
        country: json['country']
    );
  }
}

