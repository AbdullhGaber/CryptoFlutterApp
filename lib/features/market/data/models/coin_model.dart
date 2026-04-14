import '../../domain/entities/coin_entity.dart';

class CoinModel extends CoinEntity {
  CoinModel({
    required super.id,
    required super.symbol,
    required super.name,
    required super.image,
    required super.currentPrice,
    required super.priceChangePercentage24h,
    required super.sparkline,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    List<double> parsedSparkline = [];
    if (json['sparkline_in_7d'] != null &&
        json['sparkline_in_7d']['price'] != null) {
      parsedSparkline = List<double>.from(
        json['sparkline_in_7d']['price'].map((x) => x.toDouble()),
      );
    }

    return CoinModel(
      id: json['id'] ?? '',
      symbol: (json['symbol'] ?? '').toString().toUpperCase(),
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      currentPrice: (json['current_price'] ?? 0).toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] ?? 0)
          .toDouble(),
      sparkline: parsedSparkline,
    );
  }
}
