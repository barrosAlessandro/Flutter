import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_avancado/models/meeting_model.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;


Future<List<MeetingModel>> getMeetingsData() async {
  const r = RetryOptions(maxAttempts: 3);
  final response = await r.retry(
        () => http.get(Uri.parse('https://study-web-app.herokuapp.com/')).timeout(const Duration(seconds: 10)),
    // Retry on SocketException or TimeoutException
    retryIf: (e) => e is SocketException || e is TimeoutException,
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> responseData = jsonDecode(response.body);
    List<MeetingModel> meetingsList = responseData
        .map(
          (dynamic item) {
            // DBProvider.db.createInfoPlants(InfoPlants.fromJson(item));
            // DBProvider.db.insertFavoritePlants(InfoPlants.fromJson(item));

            return MeetingModel.fromJson(item);
          }
    )
        .toList();

    return meetingsList;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}