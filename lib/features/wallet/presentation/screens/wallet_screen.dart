import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:flutter_project_2/core/helpers/extensions.dart';
import '../../../../core/localization/loc.dart';
import '../../../market/presentation/models/market_coin_type.dart';
import '../widgets/wallet_coin_row.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryMint = Theme.of(context).primaryColor;
    final mutedTextColor = AppRawColors.textSecondaryDark;
    final surfaceDark = AppRawColors.surfaceDark;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: context.screenHeight * 0.35,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: context.screenHeight * 0.35,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: Responsive.padding(context, 24),
                right: Responsive.padding(context, 24),
                top: Responsive.padding(context, 40),
                bottom: Responsive.padding(context, 120),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Loc.wallet.currentBalance,
                        style: TextStyle(
                          color: mutedTextColor,
                          fontSize: Responsive.text(context, 14),
                        ),
                      ),
                      Icon(
                        Icons.visibility_off_outlined,
                        color: mutedTextColor,
                        size: Responsive.icon(context, 20),
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.value(context, 8)),

                  Text(
                    '40,059.83',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: Responsive.text(context, 36),
                    ),
                  ),
                  SizedBox(height: Responsive.value(context, 4)),
                  Text(
                    '\$468,554.23',
                    style: TextStyle(
                      color: mutedTextColor,
                      fontSize: Responsive.text(context, 16),
                    ),
                  ),

                  SizedBox(height: Responsive.value(context, 40)),

                  Container(
                    height: Responsive.value(context, 52),
                    decoration: BoxDecoration(
                      color: surfaceDark,
                      borderRadius: BorderRadius.circular(Responsive.value(context, 16)),
                    ),
                    child: Row(
                      children: [
                        _buildActionTab(
                          context: context,
                          title: Loc.wallet.deposit, 
                          isActive: true, 
                          activeColor: primaryMint, 
                          activeTextColor: AppRawColors.backgroundDark,
                          inactiveTextColor: mutedTextColor,
                        ),
                        _buildActionTab(
                          context: context,
                          title: Loc.wallet.withdraw, 
                          isActive: false, 
                          activeColor: primaryMint, 
                          activeTextColor: AppRawColors.backgroundDark,
                          inactiveTextColor: mutedTextColor,
                        ),
                        _buildActionTab(
                          context: context,
                          title: Loc.wallet.transfer, 
                          isActive: false, 
                          activeColor: primaryMint, 
                          activeTextColor: AppRawColors.backgroundDark,
                          inactiveTextColor: mutedTextColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: Responsive.value(context, 32)),

                  Column(
                    children: MarketCoinType.values.map((coin) {
                      return WalletCoinRow(
                        coin: coin,
                        onTap: () {},
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTab({
    required BuildContext context,
    required String title, 
    required bool isActive,
    required Color activeColor,
    required Color activeTextColor,
    required Color inactiveTextColor,
  }) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(Responsive.value(context, 16)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? activeTextColor : inactiveTextColor,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: Responsive.text(context, 14),
          ),
        ),
      ),
    );
  }
}