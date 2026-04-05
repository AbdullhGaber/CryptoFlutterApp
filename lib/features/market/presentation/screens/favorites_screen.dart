import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:go_router/go_router.dart';
import '../cubit/market_cubit.dart';
import '../cubit/market_state.dart';
import '../widgets/market_coin_row.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MarketCubit>().fetchTopCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Favorites',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<MarketCubit, MarketState>(
        builder: (context, state) {
          if (state is MarketLoading || state is MarketInitial) {
            return const Center(
              child: CircularProgressIndicator(color: AppRawColors.primaryDark),
            );
          } else if (state is MarketError) {
            return Center(
              child: Text(
                'Failed to load favorites:\n${state.message}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          } else if (state is MarketLoaded) {
            final favoriteCoins = state.coins.where((coin) => state.favoriteIds.contains(coin.id)).toList();

            if (favoriteCoins.isEmpty) {
              return _buildEmptyState(context);
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              itemCount: favoriteCoins.length,
              itemBuilder: (context, index) {
                final coin = favoriteCoins[index];

                return MarketCoinRow(
                  coin: coin,
                  isFavorite: true,
                  onTap: () {},
                  onFavoriteToggle: () {
                    context.read<MarketCubit>().toggleFavorite(coin);
                  },
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final mutedTextColor = AppRawColors.textSecondaryDark;
    final primaryMint = Theme.of(context).primaryColor;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryMint.withValues(alpha: 0.1),
              ),
              child: Icon(
                Icons.star_outline,
                size: 64,
                color: primaryMint,
              ),
            ),
            const SizedBox(height: 32),

            Text(
              'No Favorites Yet',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Text(
              'Keep track of the coins you love by tapping the star icon in the market.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mutedTextColor,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => context.pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppRawColors.surfaceVariantDark,
                foregroundColor: Colors.white,
                elevation: 0,
                minimumSize: const Size(200, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Explore Market'),
            ),
          ],
        ),
      ),
    );
  }
}