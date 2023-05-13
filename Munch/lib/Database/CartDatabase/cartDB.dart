import '../CartDatabase/cartModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {

  static final _databaseName = "cartDB.db";
  static final _databaseVersion = 1;

  static final table = 'cart_table';

  static final columnCartId = 'cartId';
  static final columnUrl = 'url';
  static final columnName = 'name';
  static final columnPrice = 'price';
  static final columnRate = 'rate';
  static final columnClients = 'clients';


  CartDatabase._privateConstructor();
  static final CartDatabase instance = CartDatabase._privateConstructor();

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
            $columnCartId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnUrl TEXT NOT NULL,
            $columnName TEXT NOT NULL,
            $columnPrice REAL NOT NULL,
            $columnRate REAL NOT NULL,
            $columnClients INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(CartModel cart) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'url': cart.url,
      'name': cart.name,
      'price': cart.price,
      'rate': cart.rate,
      'clients': cart.clients
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryCart() async {
    Database db = await instance.database;
    return await db.query(table);
  }


  Future<int> update(CartModel cart) async {
    Database db = await instance.database;
    int id = cart.toMap()['foodId'];
    return await db.update(table, cart.toMap(), where: '$columnCartId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnCartId = ?', whereArgs: [id]);
  }

}