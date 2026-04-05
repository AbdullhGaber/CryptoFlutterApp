import 'package:flutter_project_2/core/network/dio_client.dart';
import 'package:flutter_project_2/features/market/data/network/market_service.dart';
import '../../../network/api_constants.dart';
import '../../../../features/market/data/models/coin_model.dart';


abstract class RemoteDataSource {
  Future<List<CoinModel>> fetchMarkets({required String currency, required int limit});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final MarketService marketService;
  RemoteDataSourceImpl({required this.marketService});

  @override
  Future<List<CoinModel>> fetchMarkets({required String currency, required int limit}) async {
     return marketService.fetchMarkets(currency: currency, limit: limit);
  }
}