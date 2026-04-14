import '../../../../core/network/api_state.dart';
import '../models/coin_model.dart';
import '../network/market_service.dart';

abstract class MarketRemoteDataSource {
  Future<ApiState<List<CoinModel>>> fetchMarkets({
    required String currency,
    required int limit,
  });
}

class MarketRemoteDataSourceImpl implements MarketRemoteDataSource {
  final MarketService marketService;

  MarketRemoteDataSourceImpl({required this.marketService});

  @override
  Future<ApiState<List<CoinModel>>> fetchMarkets({
    required String currency,
    required int limit,
  }) async {
    return marketService.fetchMarkets(currency: currency, limit: limit);
  }
}
