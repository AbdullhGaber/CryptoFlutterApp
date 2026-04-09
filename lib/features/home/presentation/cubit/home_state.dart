import 'package:equatable/equatable.dart';
import '../../../market/domain/entities/coin_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CoinEntity> recentCoins;

  const HomeLoaded({required this.recentCoins});

  @override
  List<Object> get props => [recentCoins];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}