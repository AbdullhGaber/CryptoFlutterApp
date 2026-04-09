import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/styles/app_colors.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/market/presentation/screens/markets_screen.dart';
import '../../features/activity/presentation/screens/activity_screen.dart';
import '../../features/wallet/presentation/screens/wallet_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});
  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;
  late final List<Widget> _screens = [
    const HomeScreen(),
    const MarketsScreen(),
    const Center(child: Text('Trades Screen')),
    const ActivityScreen(),
    const WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navBackgroundColor = AppRawColors.backgroundDark;
    final activeColor = Theme.of(context).primaryColor;
    final inactiveColor = AppRawColors.textSecondaryDark;

    return Scaffold(
      backgroundColor: AppRawColors.backgroundLight,
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),

          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                color: navBackgroundColor,
                borderRadius: BorderRadius.circular(36),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(0, 'Home', 'assets/svgs/home.svg', activeColor, inactiveColor),
                  _buildNavItem(1, 'Markets', 'assets/svgs/market.svg', activeColor, inactiveColor),
                  _buildNavItem(2, 'Trades', 'assets/svgs/trades.svg', activeColor, inactiveColor),
                  _buildNavItem(3, 'Activity', 'assets/svgs/activity.svg', activeColor, inactiveColor),
                  _buildNavItem(4, 'Wallets', 'assets/svgs/wallet.svg', activeColor, inactiveColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath, Color activeColor, Color inactiveColor) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? activeColor : inactiveColor;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.8,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              height: 28,
              width: 28,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}