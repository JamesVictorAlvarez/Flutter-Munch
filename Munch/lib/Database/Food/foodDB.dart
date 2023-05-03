import '../Food/food.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FoodDatabase {

  static final _databaseName = "foodDB.db";
  static final _databaseVersion = 1;

  static final table = 'food_table';

  static final columnFoodId = 'foodId';
  static final columnUrl = 'url';
  static final columnName = 'name';
  static final columnPrice = 'price';
  static final columnRate = 'rate';
  static final columnClients = 'clients';

  FoodDatabase._privateConstructor();
  static final FoodDatabase instance = FoodDatabase._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnFoodId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnUrl TEXT NOT NULL,
            $columnName TEXT NOT NULL,
            $columnPrice REAL NOT NULL,
            $columnRate REAL NOT NULL,
            $columnClients INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Food food) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'url': food.url,
      'name': food.name,
      'price': food.price,
      'rate': food.rate,
      'clients': food.clients
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(Food food) async {
    Database db = await instance.database;
    int id = food.toMap()['foodId'];
    return await db.update(table, food.toMap(), where: '$columnFoodId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnFoodId = ?', whereArgs: [id]);
  }

}