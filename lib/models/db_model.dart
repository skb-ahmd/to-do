import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';

class DatabaseConnect {
  Database? _database;

  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    const dbName = 'tasks.db';
    final path = join(dbPath, dbName);
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

  Future<void> _createDB(
    Database db,
    int version,
  ) async {
    await db.execute('''CREATE TABLE `tasks` 
  ( `id` INT NOT NULL AUTO_INCREMENT , 
  `title` TEXT NOT NULL , 
  `description` TEXT NOT NULL , 
  `date` TEXT NOT NULL , PRIMARY KEY (`id`))''');
  }

  Future<void> insertTask(Task task) async {
    final db = await database;
    await db.insert(
      'tasks',
      task.toMap(),
    );
  }
}
