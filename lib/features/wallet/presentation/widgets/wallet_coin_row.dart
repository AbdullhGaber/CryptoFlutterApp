import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../market/presentation/models/market_coin_type.dart';

class WalletCoinRow extends StatelessWidget {
  final MarketCoinType coin;
  final VoidCallback onTap;

  const WalletCoinRow({
    super.key,
    required this.coin,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color mutedTextColor = AppRawColors.textSecondaryDark;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Responsive.padding(context, 16)),
        child: Row(
          children: [
            SvgPicture.asset(
              coin.getIconPath(),
              height: Responsive.value(context, 40),
              width: Responsive.value(context, 40),
            ),
            SizedBox(width: Responsive.value(context, 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.getName(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Responsive.value(context, 4)),
                  Text(
                    coin.getSymbol(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: mutedTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  coin.getCryptoBalance(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Responsive.value(context, 4)),
                Text(
                  coin.getFiatBalance(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: mutedTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}