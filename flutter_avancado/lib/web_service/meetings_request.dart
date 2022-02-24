import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_avancado/models/meeting_model.dart';
import 'package:flutter_avancado/providers/models.dart';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import '../providers/db_provider.dart';


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
            DBProvider.db.insertMeetings(MeetingsTable.fromJson(item));
            // print(item['sessions'][0]);
            // log('BBBBBBBBBBBBBBBBBB');

            // item['sessions'].map((dynamic session) {
              // return DBProvider.db.insertSessions(SessionsTable.fromJson(session));
              // session['columns'].map((dynamic column) => DBProvider.db.insertColumns(ColumnsTable.fromJson(column)));
              // session['stickies'].map((dynamic sticky) => DBProvider.db.insertStickies(StickiesTable.fromJson(sticky)));
            // });
            // DBProvider.db.insertSessions(SessionsTable.fromJson(item['sessions'][0]));


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