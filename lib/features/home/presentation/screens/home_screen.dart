import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import '../../../../core/layout/widgets/app_layout_header.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/localization/loc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkHeaderColor = AppRawColors.backgroundDark;

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: Responsive.padding(context, 120)),
      child: Column(
        children: [
          Container(
            color: darkHeaderColor,
            padding: EdgeInsets.only(
              top: Responsive.padding(context, 60),
              left: Responsive.padding(context, 24),
              right: Responsive.padding(context, 24),
              bottom: Responsive.padding(context, 24),
            ),
            child: Column(
              children: [
                appLayoutHeader(context),
                SizedBox(height: Responsive.value(context, 32)),
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: Responsive.value(context, 24),
                  crossAxisSpacing: Responsive.value(context, 16),
                  children: [
                    _buildGridItem('assets/svgs/deposit.svg', Loc.home.deposit, context),
                    _buildGridItem('assets/svgs/referral.svg', Loc.home.referral, context),
                    _buildGridItem('assets/svgs/grid.svg', Loc.home.gridTrading, context),
                    _buildGridItem('assets/svgs/margin.svg', Loc.home.margin, context),
                    _buildGridItem('assets/svgs/launchpad.svg', Loc.home.launchpad, context),
                    _buildGridItem('assets/svgs/savings.svg', Loc.home.savings, context),
                    _buildGridItem('assets/svgs/liquid.svg', Loc.home.liquidSwap, context),
                    _buildGridItem('assets/svgs/more.svg', Loc.home.more, context),
                  ],
                ),
              ],
            ),
          ),

          Container(
            color: AppRawColors.backgroundLight,
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.padding(context, 24),
              vertical: Responsive.padding(context, 24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildActionCard(
                  context: context,
                  title: Loc.home.p2pTrading,
                  subtitle: Loc.home.p2pTradingDesc,
                  iconPath: 'assets/svgs/rocket.svg',
                ),
                SizedBox(height: Responsive.value(context, 16)),

                _buildActionCard(
                  context: context,
                  title: Loc.home.creditDebitCard,
                  subtitle: Loc.home.creditDebitCardDesc,
                  iconPath: 'assets/svgs/credit.svg',
                ),

                SizedBox(height: Responsive.value(context, 32)),

                Text(
                  Loc.home.recentCoin,
                  style: TextStyle(
                    fontSize: Responsive.text(context, 18),
                    fontWeight: FontWeight.bold,
                    color: darkHeaderColor,
                  ),
                ),

                SizedBox(height: Responsive.value(context, 16)),

                SizedBox(
                  height: Responsive.value(context, 140),
                  child: Center(
                    child: Text(Loc.home.coinCardsPlaceholder, style: const TextStyle(color: Colors.grey)),
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
            colorFilter: const ColorFilter.mode(AppRawColors.primaryDark, BlendMode.srcIn),
            height: Responsive.icon(context, 28),
            width: Responsive.icon(context, 28),
          )
        ),
        SizedBox(height: Responsive.value(context, 4)),
        Text(
          label,
          style: TextStyle(
            color: AppRawColors.textSecondaryDark,
            fontSize: Responsive.text(context, 11),
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String iconPath,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Responsive.value(context, 24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: Responsive.value(context, 10),
            spreadRadius: 0,
            offset: Offset(0, Responsive.value(context, 4)),
          ),
        ],
      ),
      padding: EdgeInsets.all(Responsive.padding(context, 16)),
      child: Row(
        children: [
          Container(
            height: Responsive.value(context, 48),
            width: Responsive.value(context, 48),
            padding: EdgeInsets.all(Responsive.padding(context, 8)),
            child: Transform.scale(
              scale: 1.6,
              child: SvgPicture.asset(
                iconPath,
                height: Responsive.icon(context, 28),
                width: Responsive.icon(context, 28),
              )
            )
          ),
          SizedBox(width: Responsive.value(context, 4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Responsive.text(context, 16),
                    fontWeight: FontWeight.w600,
                    color: AppRawColors.backgroundDark,
                  ),
                ),
                SizedBox(height: Responsive.value(context, 4)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: Responsive.text(context, 13),
                    color: AppRawColors.textSecondaryDark,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(Responsive.padding(context, 8)),
            decoration: const BoxDecoration(
              color: AppRawColors.backgroundLight,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_forward, size: Responsive.icon(context, 16), color: AppRawColors.textSecondaryDark),
          )
        ],
      ),
    );
  }
}