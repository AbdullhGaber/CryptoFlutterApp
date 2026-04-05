import '../../../../core/network/api_state.dart';
import '../../domain/entities/coin_entity.dart';
import '../../domain/repositories/market_repository.dart';
import '../data_sources/market_local_data_source.dart';
import '../data_sources/market_remote_data_source.dart';

class MarketRepositoryImpl implements MarketRepository {
  final MarketRemoteDataSource remoteDataSource;
  final MarketLocalDataSource localDataSource;

  MarketRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<ApiState<List<CoinEntity>>> getTopCoins({required String currency, int limit = 10}) async {
    return await remoteDataSource.fetchMarkets(currency: currency, limit: limit);
  }

  @override
  Future<List<String>> getFavoriteIds() async {
    return await localDataSource.getFavoriteIds();
  }

  @override
  Future<void> toggleFavorite(CoinEntity coin, bool isCurrentlyFavorited) async {
    if (isCurrentlyFavorited) {
      await localDataSource.removeFavorite(coin.id);
    } else {
      await localDataSource.addFavorite(coin);
    }
  }
}
