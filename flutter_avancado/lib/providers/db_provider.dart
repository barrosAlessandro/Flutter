import 'dart:io';
import 'package:flutter_avancado/models/meeting_model.dart';
import 'package:flutter_avancado/providers/models.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer';


class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async =>
      _database ??= await initDB();

  // Create the database and the InfoPlants table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'sticky_sessions_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: _criarBanco,);
  }

  Future<void> _criarBanco(Database db, int novaVersao) async {

    List<String> queryes = [
      'CREATE TABLE Meetings('
          'id TEXT,'
          'title TEXT,'
          'description TEXT,'
          'startDate TEXT,'
          'endDate TEXT,'
          'local TEXT'
          ')',
      'CREATE TABLE Sessions('
          'id TEXT,'
          'meetingId TEXT,'
          'name TEXT,'
          'description TEXT,'
          'highlight TEXT'
          ')',
      'CREATE TABLE Columns('
          'name TEXT,'
          'color TEXT'
          ')',
      'CREATE TABLE Stickies('
          'id TEXT,'
          'content TEXT,'
          'columnName TEXT,'
          'userName TEXT,'
          'sessionId'
          ')'              

    ];

    for (String query in queryes) {
      await db.execute(query);
    }
  }


  // Insert InfoPlants on database
  insertMeetings(MeetingsTable newMeetings) async {
    await deleteAllMeetings();
    final db = await database;
    final res = await db.insert('Meetings', newMeetings.toJson());

    return res;
  }

  // Delete all InfoPlants
  Future<int> deleteAllMeetings() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Meetings');

    return res;
  }


  //##########################
  //##########################


  // Insert InfoPlants on database
  insertSessions(SessionsTable newSessions) async {
    await deleteAllSessions();
    final db = await database;
    final res = await db.insert('Sessions', newSessions.toJson());

    return res;
  }

  // Delete all InfoPlants
  Future<int> deleteAllSessions() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Sessions');

    return res;
  }

  //##########################
  //##########################


    // Insert InfoPlants on database
  insertColumns(ColumnsTable newInfoPlants) async {
    await deleteAllColumns();
    final db = await database;
    final res = await db.insert('Columns', newInfoPlants.toJson());

    return res;
  }

  // Delete all InfoPlants
  Future<int> deleteAllColumns() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Columns');

    return res;
  }
  
  //##########################
  //##########################

    // Insert InfoPlants on database
  insertStickies(StickiesTable newInfoPlants) async {
    await deleteStickies();
    final db = await database;
    final res = await db.insert('Stickies', newInfoPlants.toJson());

    return res;
  }

  // Delete all InfoPlants
  Future<int> deleteStickies() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Stickies');

    return res;
  }




  // Future<List<MeetingsTable>> getAllMeetings() async {
  //   final db = await database;
  //   final res = await db.rawQuery("SELECT * FROM Meetings");

  //   List<MeetingsTable> list =
  //   res.isNotEmpty ? res.map((c) => MeetingsTable.fromJson(c)).toList() : [];

  //   print(list);
  //   return list;
  // }

  // Future<List<SessionsTable>> getAllSessions() async {
  //   final db = await database;
  //   final res = await db.rawQuery("SELECT * FROM Sessions");

  //   List<SessionsTable> list =
  //   res.isNotEmpty ? res.map((c) => SessionsTable.fromJson(c)).toList() : [];

  //   print(list);
  //   return list;
  // }

  //   Future<List<ColumnsTable>> getAllColumns() async {
  //   final db = await database;
  //   final res = await db.rawQuery("SELECT * FROM Columns");

  //   List<ColumnsTable> list =
  //   res.isNotEmpty ? res.map((c) => ColumnsTable.fromJson(c)).toList() : [];

  //   print(list);
  //   return list;
  // }

  //   Future<List<StickiesTable>> getAllStickies() async {
  //   final db = await database;
  //   final res = await db.rawQuery("SELECT * FROM Stickies");

  //   List<StickiesTable> list =
  //   res.isNotEmpty ? res.map((c) => StickiesTable.fromJson(c)).toList() : [];

  //   print(list);
  //   return list;
  // }

  Future<List<MeetingModel>> getAllData() async {
    final db = await database;
    final resMeetings = await db.rawQuery("SELECT * FROM Meetings");
    final resSessions = await db.rawQuery("SELECT * FROM Sessions");
    final resColumns = await db.rawQuery("SELECT * FROM Columns");
    final resStickies = await db.rawQuery("SELECT * FROM Stickies");



    List<MeetingsTable> listMeetings =
    resMeetings.isNotEmpty ? resMeetings.map((c) => MeetingsTable.fromJson(c)).toList() : [];

    List<SessionsTable> listSessions =
    resSessions.isNotEmpty ? resSessions.map((c) => SessionsTable.fromJson(c)).toList() : [];
    
    List<ColumnsTable> listColumns =
    resColumns.isNotEmpty ? resColumns.map((c) => ColumnsTable.fromJson(c)).toList() : [];

    List<StickiesTable> listStickies =
    resStickies.isNotEmpty ? resStickies.map((c) => StickiesTable.fromJson(c)).toList() : [];


    List<MeetingModel> ListAllData = [];

    for (var i = 0; i < listMeetings.length; i++) {
      ListAllData.add(MeetingModel(
        id: listMeetings[i].id,
        title: listMeetings[i].title,
        description: listMeetings[i].description,
        startDate: listMeetings[i].startDate,
        endDate: listMeetings[i].endDate,
        local: listMeetings[i].local,
        sessions: getRespectiveSessions(listSessions, listColumns, listStickies, listMeetings[i].id)
        

      ));
      
    }

    // print(ListAllData.map((e) => e));po
    // log(ListAllData);
    return ListAllData;
  }

  List<Sessions> getRespectiveSessions(List<SessionsTable> listSessions, List<ColumnsTable> listColumns, List<StickiesTable> listStickies, String meetingId){
    List<Sessions> respectiveSessions = [];
    for (var i = 0; i < listSessions.length; i++) {
      if(listSessions[i].meetingId == meetingId){
        respectiveSessions.add(Sessions(
          id: listSessions[i].id,
          meetingId: listSessions[i].meetingId,
          name: listSessions[i].name,
          description: listSessions[i].description,
          highlight: listSessions[i].highlight,
          columns: getRespectiveColumns(listColumns),
          stickies: getRespectiveStickies(listStickies, listSessions[i].id)

        ));

      }
    }

    return respectiveSessions;

  }

  List<Stickies> getRespectiveStickies(List<StickiesTable> listStickies, String sessionId){
    List<Stickies> respectiveStickies = [];

    for (var i = 0; i < listStickies.length; i++) {
      if(listStickies[i].sessionId == sessionId){
        respectiveStickies.add(Stickies(
          id: listStickies[i].id,
          content: listStickies[i].content,
          columnName: listStickies[i].columnName,
          userName: listStickies[i].userName,
          sessionId: listStickies[i].sessionId
        ));
      }
    }

    return respectiveStickies;
  }


  List<Columns> getRespectiveColumns(List<ColumnsTable> listColumns){
    List<Columns> respectiveColumns = [];

    for (var i = 0; i < listColumns.length; i++) {
        respectiveColumns.add(Columns(
          name: listColumns[i].name,
          color: listColumns[i].color,

        ));
      
    }

    return respectiveColumns;
  }


}