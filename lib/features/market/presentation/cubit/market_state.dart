import 'package:equatable/equatable.dart';
import '../../domain/entities/coin_entity.dart';

abstract class MarketState extends Equatable {
  const MarketState();

  @override
  List<Object> get props => [];
}

class MarketInitial extends MarketState {}

class MarketLoading extends MarketState {}

class MarketLoaded extends MarketState {
  final List<CoinEntity> coins;
  final List<String> favoriteIds;

  const MarketLoaded({required this.coins, this.favoriteIds = const []});

  @override
  List<Object> get props => [coins, favoriteIds];
}

class MarketError extends MarketState {
  final String message;

  const MarketError({required this.message});

  @override
  List<Object> get props => [message];
}
