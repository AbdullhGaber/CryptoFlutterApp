import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/widgets/build_sparkline.dart';
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
    final Color trendColor = isUp ? Theme.of(context).primaryColor : AppRawColors.errorDark;
    final Color mutedTextColor = AppRawColors.textSecondaryDark;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Image.network(
              coin.image,
              height: 40,
              width: 40,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.grey),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    coin.symbol,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: mutedTextColor),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: SizedBox(
                height: 40,
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
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

            const SizedBox(width: 8),

            GestureDetector(
              onTap: onFavoriteToggle,
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? AppRawColors.favoriteDark : mutedTextColor,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}