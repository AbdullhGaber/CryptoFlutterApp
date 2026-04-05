import '../../../../core/storage/database_helper.dart';
import '../../domain/entities/coin_entity.dart';

abstract class MarketLocalDataSource {
  Future<void> addFavorite(CoinEntity coin);
  Future<void> removeFavorite(String id);
  Future<List<String>> getFavoriteIds();
}

class MarketLocalDataSourceImpl implements MarketLocalDataSource {
  final DatabaseHelper dbHelper;

  MarketLocalDataSourceImpl({required this.dbHelper});

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
