import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_state.dart';
import '../../domain/repositories/market_repository.dart';
import 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  final MarketRepository repository;

  MarketCubit({required this.repository}) : super(MarketInitial());

  Future<void> fetchTopCoins({String currency = 'usd', int limit = 10}) async {
    emit(MarketLoading());

    final result = await repository.getTopCoins(
      currency: currency,
      limit: limit,
    );

    switch (result) {
      case ApiSuccess(:final data):
        final favoriteIds = await repository.getFavoriteIds();
        emit(MarketLoaded(coins: data, favoriteIds: favoriteIds));
      case ApiError(:final message):
        emit(MarketError(message: message));
    }
  }

  Future<void> toggleFavorite(coin) async {
    if (state is MarketLoaded) {
      final currentState = state as MarketLoaded;
      final isCurrentlyFavorited = currentState.favoriteIds.contains(coin.id);

      await repository.toggleFavorite(coin, isCurrentlyFavorited);

      final updatedFavorites = await repository.getFavoriteIds();
      emit(
        MarketLoaded(coins: currentState.coins, favoriteIds: updatedFavorites),
      );
    }
  }
}
