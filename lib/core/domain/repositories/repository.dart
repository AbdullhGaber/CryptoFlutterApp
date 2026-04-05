import '../../../features/market/domain/entities/coin_entity.dart';

abstract class Repository {
  Future<List<CoinEntity>> getTopCoins({required String currency, int limit = 10});
  Future<List<String>> getFavoriteIds();
  Future<void> toggleFavorite(CoinEntity coin, bool isCurrentlyFavorited);

}