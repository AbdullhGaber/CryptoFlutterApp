import 'package:flutter_project_2/core/network/dio_client.dart';
import 'package:flutter_project_2/core/network/api_state.dart';
import 'package:flutter_project_2/core/network/safe_api_call.dart';

import '../../../../core/network/api_constants.dart';
import '../models/coin_model.dart';

class MarketService {
  final DioClient dioClient;
  MarketService(this.dioClient);

  Future<ApiState<List<CoinModel>>> fetchMarkets({
    required String currency,
    required int limit,
  }) async {
    return safeApiCall(() async {
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

      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => CoinModel.fromJson(json)).toList();
    });
  }
}
