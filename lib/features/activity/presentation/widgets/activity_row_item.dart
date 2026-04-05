import 'package:flutter/material.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../models/activity_model.dart';

class ActivityRowItem extends StatelessWidget {
  final ActivityModel activity;
  final VoidCallback onTap;

  const ActivityRowItem({
    super.key,
    required this.activity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mutedTextColor = AppRawColors.textSecondaryDark;
    final tradeColor = activity.type.getColor(context);
    final statusColor = activity.status.getColor(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: tradeColor.withValues(alpha: 0.15), // Replaces withOpacity
              ),
              alignment: Alignment.center,
              child: Text(
                activity.type.label,
                style: TextStyle(
                  color: tradeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.pair,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Amount', style: TextStyle(color: mutedTextColor, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('Price', style: TextStyle(color: mutedTextColor, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('Status', style: TextStyle(color: mutedTextColor, fontSize: 13)),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      activity.date,
                      style: TextStyle(color: mutedTextColor, fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios, color: mutedTextColor, size: 12),
                  ],
                ),
                const SizedBox(height: 8),

                RichText(
                  text: TextSpan(
                    text: activity.filledAmount,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: '/${activity.totalAmount}',
                        style: TextStyle(color: mutedTextColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),

                Text(
                  activity.price,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
                const SizedBox(height: 4),

                Text(
                  activity.status.label,
                  style: TextStyle(color: statusColor, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}