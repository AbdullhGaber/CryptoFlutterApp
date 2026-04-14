import '../../../../core/network/api_state.dart';
import '../entities/coin_entity.dart';

abstract class MarketRepository {
  Future<ApiState<List<CoinEntity>>> getTopCoins({
    required String currency,
    int limit = 10,
  });
  Future<List<String>> getFavoriteIds();
  Future<void> toggleFavorite(CoinEntity coin, bool isCurrentlyFavorited);
}
