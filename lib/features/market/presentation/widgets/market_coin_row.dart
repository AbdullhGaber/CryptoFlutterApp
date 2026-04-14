import 'package:flutter_project_2/core/utils/app_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/widgets/build_sparkline.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../domain/entities/coin_entity.dart';

class MarketCoinRow extends StatelessWidget {
  final CoinEntity coin;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const MarketCoinRow({
    super.key,
    required this.coin,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isUp = coin.priceChangePercentage24h >= 0;
    final Color trendColor = isUp
        ? Theme.of(context).primaryColor
        : AppRawColors.errorDark;
    final Color mutedTextColor = AppRawColors.textSecondaryDark;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppVal.padding16(context)),
        child: Row(
          children: [
            Image.network(
              coin.image,
              height: Responsive.value(context, 40),
              width: Responsive.value(context, 40),
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, color: Colors.grey),
            ),
            AppVal.horizontalSpace16(context),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppVal.verticalSpace4(context),
                  Text(
                    coin.symbol,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: mutedTextColor),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: SizedBox(
                height: Responsive.value(context, 40),
                child: buildSparkline(trendColor, coin),
              ),
            ),

            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${coin.currentPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppVal.verticalSpace4(context),
                  Text(
                    '${isUp ? '+' : ''}${coin.priceChangePercentage24h.toStringAsFixed(2)}%',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: trendColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            AppVal.horizontalSpace8(context),

            GestureDetector(
              onTap: onFavoriteToggle,
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? AppRawColors.favoriteDark : mutedTextColor,
                size: AppVal.icon24(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
