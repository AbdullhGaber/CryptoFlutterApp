import 'package:flutter/material.dart';
import '../../../market/presentation/models/market_coin_type.dart';
import '../widgets/wallet_coin_row.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryMint = Theme.of(context).primaryColor;
    final mutedTextColor = const Color(0xFFA0A5BA);
    final surfaceDark = const Color(0xFF161C22);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
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
            height: 300,
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
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0, bottom: 120.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Balance',
                        style: TextStyle(
                          color: mutedTextColor,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.visibility_off_outlined,
                        color: mutedTextColor,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Text(
                    '40,059.83',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$468,554.23',
                    style: TextStyle(
                      color: mutedTextColor,
                      fontSize: 16,
                    ),
                  ),
                  
                  const SizedBox(height: 40),

                  Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: surfaceDark,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        _buildActionTab(
                          title: 'Deposit', 
                          isActive: true, 
                          activeColor: primaryMint, 
                          activeTextColor: const Color(0xFF1B232A),
                          inactiveTextColor: mutedTextColor,
                        ),
                        _buildActionTab(
                          title: 'Withdraw', 
                          isActive: false, 
                          activeColor: primaryMint, 
                          activeTextColor: const Color(0xFF1B232A),
                          inactiveTextColor: mutedTextColor,
                        ),
                        _buildActionTab(
                          title: 'Transfer', 
                          isActive: false, 
                          activeColor: primaryMint, 
                          activeTextColor: const Color(0xFF1B232A),
                          inactiveTextColor: mutedTextColor,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),

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
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? activeTextColor : inactiveTextColor,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}