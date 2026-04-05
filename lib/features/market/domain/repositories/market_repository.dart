import '../entities/coin_entity.dart';

abstract class MarketRepository {
  Future<List<CoinEntity>> getTopCoins({required String currency, int limit = 10});
}