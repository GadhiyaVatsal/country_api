import 'dart:io';

import 'package:foxbrain_task/model/country.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider instance = DBProvider._init();

  static Database? _database;

  DBProvider._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = Path.join(documentsDirectory.path, 'country_list.db');

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
    CREATE TABLE $tableCountry (
    ${CountryField.id} $idType,
    ${CountryField.name} $boolType,
    ${CountryField.population} $textType,
    ${CountryField.flag} $textType,
    ${CountryField.isSelected} $textType,
    ${CountryField.region} $textType,
    ${CountryField.subregion} $textType,
    ${CountryField.latlng0} $textType,
    ${CountryField.latlng1} $textType,
    ${CountryField.currencies0} $textType,
    ${CountryField.currencies1} $textType,
    ${CountryField.currencies2} $textType
    )
    ''');
  }

  Future<void> create(Country country) async {
    final db = await instance.database;
    print(country);
    final id = await db!.insert(tableCountry, country.toJson());
    print(id);
    country.copy(id: id);
    //return country.copy(id: id);
  }

  /*Future<Country?> readCountry(int id) async {
    final db = await instance.database;

    final maps = await db?.query(
      tableCountry,
      columns: CountryField.values,
      where: '${CountryField.id} = ?',
      whereArgs: [id],
    );

    if (maps!.isNotEmpty) {
      return Country.fromJson(maps.first);
    } else {
      return null;
    }
  }*/

  Future<List<Country>> readAllCountry() async {
    final db = await instance.database;

    final result = await db!.query(tableCountry);

    return result.map((e) => Country.fJson(e)).toList();
  }

  /*Future<int> update(bool isSelected, int? id) async {
    final db = await instance.database;

    int count = await db!.rawUpdate(
        'UPDATE $tableCountry SET ${CountryField.isSelected} = ? WHERE ${CountryField.id} = ?',
        [isSelected, id]);

    return count;

    */ /*return db!.update(tableCountry, country.toJson(),
        where: '${CountryField.id} = ?', whereArgs: [country.id]);*/ /*
  }*/

  Future close() async {
    final db = await instance.database;
    db?.close();
  }

  Future deleteTable() async {
    final db = await instance.database;

    db?.delete(tableCountry);
  }
}
