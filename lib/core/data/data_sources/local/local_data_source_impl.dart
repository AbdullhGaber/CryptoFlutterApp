import '../../../../features/market/domain/entities/coin_entity.dart';
import '../../../storage/database_helper.dart';

abstract class LocalDataSource {
  Future<void> addFavorite(CoinEntity coin);
  Future<void> removeFavorite(String id);
  Future<List<String>> getFavoriteIds();
}

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper dbHelper;

  LocalDataSourceImpl({required this.dbHelper});

  @override
  Future<void> addFavorite(CoinEntity coin) async {
    await dbHelper.addFavorite(coin);
  }

  @override
  Future<void> removeFavorite(String id) async {
    await dbHelper.removeFavorite(id);
  }

  @override
  Future<List<String>> getFavoriteIds() async {
    return await dbHelper.getFavoriteIds();
  }
}