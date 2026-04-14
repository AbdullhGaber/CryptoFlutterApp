import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_state.dart';
import '../../../market/domain/repositories/market_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MarketRepository marketRepository;

  HomeCubit({required this.marketRepository}) : super(HomeInitial());
  Future<void> fetchRecentCoins({
    String currency = 'usd',
    int limit = 10,
  }) async {
    emit(HomeLoading());
    try {
      final result = await marketRepository.getTopCoins(
        currency: currency,
        limit: limit,
      );
      switch (result) {
        case ApiSuccess(:final data):
          emit(HomeLoaded(recentCoins: data));
        case ApiError(:final message):
          emit(HomeError(message: message));
      }
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
