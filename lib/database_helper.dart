import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

import 'models.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  String workoutTable = 'workout_table';
  String colId = 'id';
  String colName = 'name';

  // Named constructor to create instance of DatabaseHelper
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper =
          DatabaseHelper._createInstance(); // This is executed only once
    }
    return _databaseHelper!;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path to store the database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'workouts.db';

    // Open/create the database at a given path
    var workoutsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return workoutsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $workoutTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT)');
  }

  // Fetch Operation: Get all workout objects from database
  Future<List<Map<String, dynamic>>> getWorkoutMapList() async {
    Database? db = await this.database;

    var result = await db!.query(workoutTable, orderBy: '$colId ASC');
    return result;
  }

  // Insert Operation: Insert a workout object to database
  Future<int> insertWorkout(Workout workout) async {
    Database? db = await this.database;
    var result = await db!.insert(workoutTable, workout.toMap());
    return result;
  }

  // Update Operation: Update a workout object and save it to database
  Future<int> updateWorkout(Workout workout) async {
    var db = await this.database;
    var result = await db!.update(workoutTable, workout.toMap(),
        where: '$colId = ?', whereArgs: [workout.id]);
    return result;
  }

  // Delete Operation: Delete a workout object from database
  Future<int> deleteWorkout(int id) async {
    var db = await this.database;
    int result =
        await db!.rawDelete('DELETE FROM $workoutTable WHERE $colId = $id');
    return result;
  }

  // Get the 'Map List' (List<Map>) and convert it to 'Workout List' (List<Workout>)
  Future<List<Workout>> getWorkoutList() async {
    var workoutMapList =
        await getWorkoutMapList(); // Get 'Map List' from database
    int count =
        workoutMapList.length; // Count the number of map entries in db table

    List<Workout> workoutList = [];
    // For loop to create a 'Workout List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      workoutList.add(Workout.fromMapObject(workoutMapList[i]));
    }

    return workoutList;
  }
}
