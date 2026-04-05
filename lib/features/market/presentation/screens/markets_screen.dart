import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_project_2/core/layout/widgets/app_layout_header.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../cubit/market_cubit.dart';
import '../cubit/market_state.dart';
import '../widgets/market_coin_row.dart';

class MarketsScreen extends StatefulWidget {
  const MarketsScreen({super.key});

  @override
  State<MarketsScreen> createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MarketCubit>().fetchTopCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 120.0),
          child: Column(
            children: [
              appLayoutHeader(context),
              const SizedBox(height: 32),

              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF161C22),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    _buildTab(context, 'Convert', false),
                    _buildTab(context, 'Spot', true),
                    _buildTab(context, 'Margin', false),
                    _buildTab(context, 'Fiat', false),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              BlocBuilder<MarketCubit, MarketState>(
                builder: (context, state) {
                  if (state is MarketLoading || state is MarketInitial) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: CircularProgressIndicator(color: Color(0xFF5ED5A8)),
                      ),
                    );
                  } else if (state is MarketError) {
                    return Center(
                      child: Text(
                        'Failed to load data:\n${state.message}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    );
                  } else if (state is MarketLoaded) {
                    return Column(
                      children: state.coins.map((coin) {
                        final isFavorited = state.favoriteIds.contains(coin.id);

                        return MarketCoinRow(
                          coin: coin,
                          isFavorite: isFavorited,
                          onTap: () {},
                          onFavoriteToggle: () {
                            context.read<MarketCubit>().toggleFavorite(coin);
                          },
                        );
                      }).toList(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              const SizedBox(height: 32),

              DottedBorder(
                options: const RoundedRectDottedBorderOptions(
                  color: Color(0xFF262A34),
                  strokeWidth: 2,
                  dashPattern: [8, 4],
                  radius: Radius.circular(16),
                  padding: EdgeInsets.zero,
                ),
                child: InkWell(
                  onTap: () {
                    context.push(AppRouter.favorites);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: const SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_outline, color: Color(0xFFA0A5BA)),
                        SizedBox(width: 8),
                        Text(
                          'View Favorites',
                          style: TextStyle(
                            color: Color(0xFFA0A5BA),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, String title, bool isActive) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF262A34) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFFA0A5BA),
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}