import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/layout/widgets/app_layout_header.dart'; // Adjust path
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
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 120.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appLayoutHeader(context),
              const SizedBox(height: 32),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF161C22),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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

              const SizedBox(height: 32),

              Text(
                'Recent Activity',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFA0A5BA), size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward, color: Color(0xFFA0A5BA), size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Color(0xFF262A34),
      height: 1,
      thickness: 1,
      indent: 60,
      endIndent: 20,
    );
  }
}