import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/layout/widgets/app_layout_header.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkHeaderColor = const Color(0xFF1B232A);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 120),
      child: Column(
        children: [
          Container(
            color: darkHeaderColor,
            padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                appLayoutHeader(context),
                const SizedBox(height: 32),
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  children: [
                    _buildGridItem('assets/svgs/deposit.svg', 'Deposit', context),
                    _buildGridItem('assets/svgs/referral.svg', 'Referral', context),
                    _buildGridItem('assets/svgs/grid.svg', 'Grid Trading', context),
                    _buildGridItem('assets/svgs/margin.svg', 'Margin', context),
                    _buildGridItem('assets/svgs/launchpad.svg', 'Launchpad', context),
                    _buildGridItem('assets/svgs/savings.svg', 'Savings', context),
                    _buildGridItem('assets/svgs/liquid.svg', 'Liquid Swap', context),
                    _buildGridItem('assets/svgs/more.svg', 'More', context),
                  ],
                ),
              ],
            ),
          ),

          Container(
            color: const Color(0xFFF8F9FA), // Off-white body
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildActionCard(
                  title: 'P2P Trading',
                  subtitle: 'Bank Transfer, Paypal Revolut...',
                  iconPath: 'assets/svgs/rocket.svg',
                ),
                const SizedBox(height: 16),

                _buildActionCard(
                  title: 'Credit/Debit Card',
                  subtitle: 'Visa, Mastercard',
                  iconPath: 'assets/svgs/credit.svg',
                ),

                const SizedBox(height: 32),

                Text(
                  'Recent Coin',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkHeaderColor,
                  ),
                ),

                const SizedBox(height: 16),

                const SizedBox(
                  height: 140,
                  child: Center(
                    child: Text('Horizontal Coin Cards go here...', style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String iconPath, String label, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 1.8,
          child: SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(Color(0xFF5ED5A8), BlendMode.srcIn),
            height: 28,
            width: 28,
          )
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFA0A5BA),
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildActionCard({required String title, required String subtitle, required String iconPath}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.all(8),
            child: Transform.scale(
              scale: 1.6,
              child: SvgPicture.asset(
                iconPath,
                height: 28,
                width: 28,
              )
            )
          ),
          const SizedBox(width: 4,)
          ,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B232A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFA0A5BA),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_forward, size: 16, color: Color(0xFFA0A5BA)),
          )
        ],
      ),
    );
  }
}