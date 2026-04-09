import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_project_2/core/layout/widgets/app_layout_header.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/localization/loc.dart';
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
          padding: EdgeInsets.only(
            left: Responsive.padding(context, 24),
            right: Responsive.padding(context, 24),
            top: Responsive.padding(context, 16),
            bottom: Responsive.padding(context, 120),
          ),
          child: Column(
            children: [
              appLayoutHeader(context),
              SizedBox(height: Responsive.value(context, 32)),

              Container(
                height: Responsive.value(context, 48),
                decoration: BoxDecoration(
                  color: AppRawColors.surfaceDark,
                  borderRadius: BorderRadius.circular(Responsive.value(context, 16)),
                ),
                child: Row(
                  children: [
                    _buildTab(context, Loc.market.convert, false),
                    _buildTab(context, Loc.market.spot, true),
                    _buildTab(context, Loc.market.margin, false),
                    _buildTab(context, Loc.market.fiat, false),
                  ],
                ),
              ),
              SizedBox(height: Responsive.value(context, 24)),

              BlocBuilder<MarketCubit, MarketState>(
                builder: (context, state) {
                  if (state is MarketLoading || state is MarketInitial) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(Responsive.padding(context, 32)),
                        child: const CircularProgressIndicator(color: AppRawColors.primaryDark),
                      ),
                    );
                  } else if (state is MarketError) {
                    return Center(
                      child: Text(
                        '${Loc.market.failedToLoad}\n${state.message}',
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

              SizedBox(height: Responsive.value(context, 32)),

              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppRawColors.surfaceVariantDark,
                  strokeWidth: 2,
                  dashPattern: [8, 4],
                  radius: Radius.circular(Responsive.value(context, 16)),
                  padding: EdgeInsets.zero,
                ),
                child: InkWell(
                  onTap: () {
                    context.push(AppRouter.favorites);
                  },
                  borderRadius: BorderRadius.circular(Responsive.value(context, 16)),
                  child: SizedBox(
                    height: Responsive.value(context, 60),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_outline, color: AppRawColors.textSecondaryDark, size: Responsive.icon(context, 24)),
                        SizedBox(width: Responsive.value(context, 8)),
                        Text(
                          Loc.market.viewFavorites,
                          style: TextStyle(
                            color: AppRawColors.textSecondaryDark,
                            fontWeight: FontWeight.w500,
                            fontSize: Responsive.text(context, 16),
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
          color: isActive ? AppRawColors.surfaceVariantDark : Colors.transparent,
          borderRadius: BorderRadius.circular(Responsive.value(context, 16)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : AppRawColors.textSecondaryDark,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            fontSize: Responsive.text(context, 14),
          ),
        ),
      ),
    );
  }
}