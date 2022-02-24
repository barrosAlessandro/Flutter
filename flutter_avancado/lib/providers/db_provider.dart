import 'dart:io';
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




  Future<List<MeetingsTable>> getAllMeetings() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Meetings");

    List<MeetingsTable> list =
    res.isNotEmpty ? res.map((c) => MeetingsTable.fromJson(c)).toList() : [];

    print(list);
    return list;
  }

  Future<List<SessionsTable>> getAllSessions() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Sessions");

    List<SessionsTable> list =
    res.isNotEmpty ? res.map((c) => SessionsTable.fromJson(c)).toList() : [];

    print(list);
    return list;
  }

    Future<List<ColumnsTable>> getAllColumns() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Columns");

    List<ColumnsTable> list =
    res.isNotEmpty ? res.map((c) => ColumnsTable.fromJson(c)).toList() : [];

    print(list);
    return list;
  }

    Future<List<StickiesTable>> getAllStickies() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Stickies");

    List<StickiesTable> list =
    res.isNotEmpty ? res.map((c) => StickiesTable.fromJson(c)).toList() : [];

    print(list);
    return list;
  }



}