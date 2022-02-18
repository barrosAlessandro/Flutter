import 'dart:io';
import 'package:challenge_ui_plant_app/models/model_info_plants.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async =>
      _database ??= await initDB();

  // Create the database and the InfoPlants table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'info_plants_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: _criarBanco,);
  }

  Future<void> _criarBanco(Database db, int novaVersao) async {

    List<String> queryes = [
      'CREATE TABLE InfoPlants('
          'id TEXT,'
          'name TEXT,'
          'image TEXT,'
          'description TEXT,'
          'price TEXT,'
          'carelevel TEXT,'
          'country TEXT'
          ')',
      'CREATE TABLE FavoritePlants('
          'id TEXT,'
          'name TEXT,'
          'image TEXT,'
          'description TEXT,'
          'price TEXT,'
          'carelevel TEXT,'
          'country TEXT'
          ')'

      // "CREATE TABLE FavoritePlants (id TEXT, name TEXT, image TEXT, description TEXT, price TEXT, carelevel TEXT, country TEXT);",
      // "CREATE TABLE InfoPlants (id TEXT, name TEXT, image TEXT, description TEXT, price TEXT, carelevel TEXT, country TEXT);",

    ];

    for (String query in queryes) {
      await db.execute(query);
    }
  }

  // Insert InfoPlants on database
  createInfoPlants(InfoPlants newInfoPlants) async {
    await deleteAllInfoPlants();
    final db = await database;
    final res = await db.insert('InfoPlants', newInfoPlants.toJson());

    return res;
  }

  // Delete all InfoPlants
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


  insertFavoritePlants(InfoPlants newFavoritePlants) async {
    final db = await database;
    final res = await db.insert('FavoritePlants', newFavoritePlants.toJson());

    return res;
  }

  // insertInfoPlants(InfoPlants newInfoPlants) async {
  //   final db = await database;
  //   final res = await db.insert('InfoPlants', newInfoPlants.toJson());
  //
  //   return res;
  // }

  // deleteFromAllPlants(String id) async {
  //   final db = await database;
  //   final res = await db.rawDelete('DELETE FROM InfoPlants WHERE id = ?', [id]);
  //
  //   return res;
  // }

  deleteFromFavoritePlants(String id) async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM FavoritePlants WHERE id = ?', [id]);

    return res;
  }

  Future<List<InfoPlants>> getFavoriteInfoPlants() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM FavoritePlants");

    List<InfoPlants> list =
    res.isNotEmpty ? res.map((c) => InfoPlants.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<InfoPlants>> getRecommendedInfoPlants() async {
    final db = await database;
    final res = await db.rawQuery(
        "SELECT * FROM InfoPlants WHERE id NOT IN (SELECT id FROM FavoritePlants)"
    );

    List<InfoPlants> list =
    res.isNotEmpty ? res.map((c) => InfoPlants.fromJson(c)).toList() : [];

    return list;
  }



}