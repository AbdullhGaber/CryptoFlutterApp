import 'package:flutter_project_2/core/utils/app_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:flutter_project_2/core/layout/widgets/app_layout_header.dart';
import '../models/activity_model.dart';
import '../widgets/activity_row_item.dart';
import '../../../../core/localization/loc.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<ActivityModel> _activities = [
    ActivityModel(
      type: TradeType.buy,
      pair: 'BTC/BUSD',
      date: '2021-08-02 04:39:26',
      filledAmount: '0.49975',
      totalAmount: '0.49975',
      price: '2652.00',
      status: OrderStatus.filled,
    ),
    ActivityModel(
      type: TradeType.sell,
      pair: 'BTC/BUSD',
      date: '2021-08-02 04:39:26',
      filledAmount: '0.49975',
      totalAmount: '0.49975',
      price: '2652.00',
      status: OrderStatus.cancelled,
    ),
    ActivityModel(
      type: TradeType.buy,
      pair: 'BTC/BUSD',
      date: '2021-08-02 04:39:26',
      filledAmount: '0.49975',
      totalAmount: '0.49975',
      price: '2652.00',
      status: OrderStatus.filled,
    ),
    ActivityModel(
      type: TradeType.sell,
      pair: 'BTC/BUSD',
      date: '2021-08-02 04:39:26',
      filledAmount: '0.49975',
      totalAmount: '0.49975',
      price: '2652.00',
      status: OrderStatus.cancelled,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppVal.padding24(context),
            right: AppVal.padding24(context),
            top: AppVal.padding16(context),
            bottom: Responsive.padding(context, 120),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appLayoutHeader(context),
              AppVal.verticalSpace32(context),

              Container(
                decoration: BoxDecoration(
                  color: AppRawColors.surfaceDark,
                  borderRadius: AppVal.borderRadius16(context),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: AppVal.padding8(context),
                ),
                child: Column(
                  children: [
                    _buildQuickActionRow(
                      Icons.monetization_on,
                      Loc.activity.deposit,
                    ),
                    _buildDivider(),
                    _buildQuickActionRow(
                      Icons.account_balance_wallet,
                      Loc.activity.withdrawals,
                    ),
                    _buildDivider(),
                    _buildQuickActionRow(
                      Icons.shopping_cart,
                      Loc.activity.buyOrder,
                    ),
                  ],
                ),
              ),

              AppVal.verticalSpace32(context),

              Text(
                Loc.activity.recentActivity,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: Responsive.text(context, AppVal.val20),
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppVal.verticalSpace16(context),
              ..._activities.map(
                (activity) => ActivityRowItem(activity: activity, onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionRow(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppVal.padding20(context),
          vertical: AppVal.padding16(context),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppRawColors.textSecondaryDark,
              size: AppVal.icon24(context),
            ),
            AppVal.horizontalSpace16(context),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: Responsive.text(context, AppVal.val16),
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward,
              color: AppRawColors.textSecondaryDark,
              size: AppVal.icon20(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppRawColors.surfaceVariantDark,
      height: 1,
      thickness: 1,
      indent: Responsive.value(context, 60),
      endIndent: Responsive.value(context, AppVal.val20),
    );
  }
}
