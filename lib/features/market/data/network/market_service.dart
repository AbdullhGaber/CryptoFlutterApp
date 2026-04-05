import 'package:flutter_project_2/core/network/dio_client.dart';

import '../../../../core/network/api_constants.dart';
import '../models/coin_model.dart';

class MarketService{
  final DioClient dioClient;
  MarketService(this.dioClient);

  Future<List<CoinModel>> fetchMarkets({required String currency, required int limit}) async {
    try {
      final response = await dioClient.dio.get(
        ApiConstants.marketsEndpoint,
        queryParameters: {
          'vs_currency': currency,
          'order': 'market_cap_desc',
          'per_page': limit,
          'page': 1,
          'sparkline': true,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => CoinModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load market data');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}