import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../features/market/domain/entities/coin_entity.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'favorites';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'tminus1_market.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id TEXT PRIMARY KEY,
            symbol TEXT,
            name TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  Future<void> addFavorite(CoinEntity coin) async {
    final db = await database;
    await db.insert(
      tableName,
      {
        'id': coin.id,
        'symbol': coin.symbol,
        'name': coin.name,
        'image': coin.image,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<String>> getFavoriteIds() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName, columns: ['id']);
    return maps.map((map) => map['id'] as String).toList();
  }
}