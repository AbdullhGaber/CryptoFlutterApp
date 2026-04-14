import 'package:flutter_project_2/core/utils/app_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/loc.dart';
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
          Loc.market.favorites,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: Responsive.text(context, 22),
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
                '${Loc.market.failedToLoadFavorites}\n${state.message}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          } else if (state is MarketLoaded) {
            final favoriteCoins = state.coins
                .where((coin) => state.favoriteIds.contains(coin.id))
                .toList();

            if (favoriteCoins.isEmpty) {
              return _buildEmptyState(context);
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: AppVal.padding24(context),
                vertical: AppVal.padding16(context),
              ),
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
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.padding(context, 40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(AppVal.padding24(context)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryMint.withValues(alpha: 0.1),
              ),
              child: Icon(
                Icons.star_outline,
                size: AppVal.icon64(context),
                color: primaryMint,
              ),
            ),
            AppVal.verticalSpace32(context),

            Text(
              Loc.market.noFavoritesYet,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: Responsive.text(context, AppVal.val24),
                fontWeight: FontWeight.bold,
              ),
            ),
            AppVal.verticalSpace12(context),

            Text(
              Loc.market.noFavoritesDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mutedTextColor,
                fontSize: Responsive.text(context, AppVal.val16),
                height: 1.5,
              ),
            ),
            SizedBox(height: Responsive.value(context, 48)),
            ElevatedButton(
              onPressed: () => context.pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppRawColors.surfaceVariantDark,
                foregroundColor: Colors.white,
                elevation: 0,
                minimumSize: Size(
                  Responsive.value(context, 200),
                  Responsive.value(context, 56),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: AppVal.borderRadius16(context),
                ),
              ),
              child: Text(Loc.market.exploreMarket),
            ),
          ],
        ),
      ),
    );
  }
}
