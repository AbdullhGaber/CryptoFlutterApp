import 'package:equatable/equatable.dart';
import '../../domain/entities/coin_entity.dart';

abstract class MarketEvent extends Equatable {
  const MarketEvent();

  @override
  List<Object> get props => [];
}

class FetchTopCoins extends MarketEvent {
  final String currency;
  final int limit;

  const FetchTopCoins({this.currency = 'usd', this.limit = 10});

  @override
  List<Object> get props => [currency, limit];
}

class ToggleFavorite extends MarketEvent {
  final CoinEntity coin;
  const ToggleFavorite(this.coin);

  @override
  List<Object> get props => [coin];
}