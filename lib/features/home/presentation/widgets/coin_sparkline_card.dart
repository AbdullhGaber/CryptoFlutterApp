import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/widgets/build_sparkline.dart';
import '../../../../core/helpers/responsive.dart';
import '../../../market/domain/entities/coin_entity.dart';

class CoinSparklineCard extends StatelessWidget {
  final CoinEntity coin;

  const CoinSparklineCard({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final bool isUp = coin.priceChangePercentage24h >= 0;
    final Color trendColor = isUp ? const Color(0xFF00C076) : const Color(0xFFFF6838);
    return Container(
      width: Responsive.value(context, 160),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Responsive.value(context, 20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: Responsive.value(context, 10),
            offset: Offset(0, Responsive.value(context, 4)),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(Responsive.padding(context, 16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        coin.currentPrice.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: Responsive.text(context, 16),
                          fontWeight: FontWeight.bold,
                          color: trendColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Image.network(
                      coin.image,
                      height: Responsive.icon(context, 24),
                      width: Responsive.icon(context, 24),
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 24),
                    ),
                  ],
                ),
                SizedBox(height: Responsive.value(context, 8)),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${coin.symbol.toUpperCase()}/BUSD',
                        style: TextStyle(
                          fontSize: Responsive.text(context, 12),
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1B232A),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: Responsive.value(context, 4)),
                    Text(
                      '${isUp ? '+' : ''}${coin.priceChangePercentage24h.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontSize: Responsive.text(context, 11),
                        fontWeight: FontWeight.w500,
                        color: trendColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),
          SizedBox(
            height: Responsive.value(context, 50),
            child: buildSparkline(trendColor, coin),
          ),
        ],
      ),
    );
  }
}