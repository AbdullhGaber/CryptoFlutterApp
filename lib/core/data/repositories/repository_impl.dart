import '../../../features/market/domain/entities/coin_entity.dart';
import '../../domain/repositories/repository.dart';
import '../data_sources/local/local_data_source_impl.dart';
import '../data_sources/remote/remote_data_source_impl.dart';

class AppRepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AppRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<CoinEntity>> getTopCoins({required String currency, int limit = 10}) async {
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