import 'dart:async';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lokaverk/database/log.dart';
import 'log_throw.dart';
import 'log_vitni.dart';
import 'log_field.dart';

class LogDatabase {
  static final LogDatabase instance = LogDatabase._init();

  static Database? _database;

  LogDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('test11.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    print("wow");
    await db.execute('''
        CREATE TABLE $tableLogs (
        ${LogFieldsThrows.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${LogFieldsPerson.framendiVitni} TEXT,
        ${LogFieldsPerson.bakendiVitni} TEXT,
        ${LogFieldsPerson.kassadeildVitni} TEXT,
        ${LogFieldsPerson.soludeildVitni} TEXT,
        ${LogFieldsPerson.kastari} TEXT NOT NULL,
        ${LogFieldsThrows.yellowThrow} INTEGER NOT NULL,
        ${LogFieldsThrows.redThrow} INTEGER NOT NULL,
        ${LogFieldsThrows.greenThrow} INTEGER,
        ${LogFieldsThrows.blueThrow} INTEGER,
        ${LogFieldsThrows.time} TEXT NOT NULL,
        ${LogFieldsThrows.nidurstada} INTEGER NOT NULL
    )
    ''');
  }

  Future<Log> create(Log log) async {
    final db = await instance.database;
    //print(log.toJson());
    final id = await db.insert(tableLogs, log.toJson());
    return log.copy(id: id);
  }

  Future<Log?> readLog(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableLogs,
      columns: LogFields.values,
      where: '${LogFieldsThrows.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Log.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Log>> readAllLogs() async {
    final db = await instance.database;

    final orderBy = '${LogFieldsThrows.time} DESC';
    final result = await db.query(tableLogs, orderBy: orderBy);
    // tok ut þetta eftir table logs columns: LogFields.values,
    //final test = result.map((json) => Log.fromJson(json)).toList();
    //print(test.length);
    //print(test);
    return result.map((json) => Log.fromJson(json)).toList();
  }

  Future<int> update(Log log) async {
    final db = await instance.database;

    return db.update(
      tableLogs,
      log.toJson(),
      where: '${LogFieldsThrows.id} = ?',
      whereArgs: [log.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableLogs,
      where: '${LogFieldsThrows.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
