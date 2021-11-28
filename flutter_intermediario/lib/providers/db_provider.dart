import 'dart:io';
import 'package:challenge_ui_plant_app/models/model_info_plants.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  // Future<Database> get database async {
  //   // If database exists, return database
  //   if (_database != null) return _database;
  //
  //   // If database don't exists, create one
  //   _database ??= await initDB();
  //
  //   return _database;
  // }

  Future<Database> get database async =>
      _database ??= await initDB();

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'info_plants_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE InfoPlants('
              'id TEXT,'
              'name TEXT,'
              'image TEXT,'
              'description TEXT,'
              'price TEXT,'
              'carelevel TEXT,'
              'country TEXT'
              ')');
        });
  }

  // Insert employee on database
  createInfoPlants(InfoPlants newInfoPlants) async {
    await deleteAllInfoPlants();
    final db = await database;
    final res = await db.insert('InfoPlants', newInfoPlants.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllInfoPlants() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM InfoPlants');

    return res;
  }

  Future<List<InfoPlants>> getAllInfoPlants() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM InfoPlants");

    List<InfoPlants> list =
    res.isNotEmpty ? res.map((c) => InfoPlants.fromJson(c)).toList() : [];

    return list;
  }
}