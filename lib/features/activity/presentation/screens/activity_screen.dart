import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/theme/styles/app_colors.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:flutter_project_2/core/layout/widgets/app_layout_header.dart';
import '../models/activity_model.dart';
import '../widgets/activity_row_item.dart';

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
            left: Responsive.padding(context, 24),
            right: Responsive.padding(context, 24),
            top: Responsive.padding(context, 16),
            bottom: Responsive.padding(context, 120),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appLayoutHeader(context),
              SizedBox(height: Responsive.value(context, 32)),

              Container(
                decoration: BoxDecoration(
                  color: AppRawColors.surfaceDark,
                  borderRadius: BorderRadius.circular(Responsive.value(context, 16)),
                ),
                padding: EdgeInsets.symmetric(vertical: Responsive.padding(context, 8)),
                child: Column(
                  children: [
                    _buildQuickActionRow(Icons.monetization_on, 'Deposit'),
                    _buildDivider(),
                    _buildQuickActionRow(Icons.account_balance_wallet, 'Withdrawals'),
                    _buildDivider(),
                    _buildQuickActionRow(Icons.shopping_cart, 'Buy Order'),
                  ],
                ),
              ),

              SizedBox(height: Responsive.value(context, 32)),

              Text(
                'Recent Activity',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: Responsive.text(context, 20),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Responsive.value(context, 16)),
              ..._activities.map((activity) => ActivityRowItem(
                activity: activity,
                onTap: () {},
              )),
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
          horizontal: Responsive.padding(context, 20),
          vertical: Responsive.padding(context, 16),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppRawColors.textSecondaryDark, size: Responsive.icon(context, 24)),
            SizedBox(width: Responsive.value(context, 16)),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: Responsive.text(context, 16),
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward, color: AppRawColors.textSecondaryDark, size: Responsive.icon(context, 20)),
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
      endIndent: Responsive.value(context, 20),
    );
  }
}