import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_state.dart';
import '../../domain/repositories/market_repository.dart';
import 'market_event.dart';
import 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final MarketRepository repository;

  MarketBloc({required this.repository}) : super(MarketInitial()) {
    on<FetchTopCoins>(_onFetchTopCoins);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onFetchTopCoins(FetchTopCoins event, Emitter<MarketState> emit) async {
    emit(MarketLoading());

    final result = await repository.getTopCoins(currency: event.currency, limit: event.limit);

    switch (result) {
      case ApiSuccess(:final data):
        final favoriteIds = await repository.getFavoriteIds();
        emit(MarketLoaded(coins: data, favoriteIds: favoriteIds));
      case ApiError(:final message):
        emit(MarketError(message: message));
    }
  }

  Future<void> _onToggleFavorite(ToggleFavorite event, Emitter<MarketState> emit) async {
    if (state is MarketLoaded) {
      final currentState = state as MarketLoaded;
      final isCurrentlyFavorited = currentState.favoriteIds.contains(event.coin.id);

      await repository.toggleFavorite(event.coin, isCurrentlyFavorited);

      final updatedFavorites = await repository.getFavoriteIds();
      emit(MarketLoaded(coins: currentState.coins, favoriteIds: updatedFavorites));
    }
  }
}