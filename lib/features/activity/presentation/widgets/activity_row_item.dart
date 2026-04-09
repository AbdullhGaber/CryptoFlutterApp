import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../models/activity_model.dart';
import '../../../../core/localization/loc.dart';

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
      borderRadius: BorderRadius.circular(Responsive.value(context, 16)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Responsive.padding(context, 16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Responsive.value(context, 48),
              height: Responsive.value(context, 48),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: tradeColor.withValues(alpha: 0.15),
              ),
              alignment: Alignment.center,
              child: Text(
                activity.type.label,
                style: TextStyle(
                  color: tradeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.text(context, 14),
                ),
              ),
            ),
            SizedBox(width: Responsive.value(context, 16)),

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
                  SizedBox(height: Responsive.value(context, 8)),
                  Text(Loc.activity.amount, style: TextStyle(color: mutedTextColor, fontSize: Responsive.text(context, 13))),
                  SizedBox(height: Responsive.value(context, 4)),
                  Text(Loc.activity.price, style: TextStyle(color: mutedTextColor, fontSize: Responsive.text(context, 13))),
                  SizedBox(height: Responsive.value(context, 4)),
                  Text(Loc.activity.status, style: TextStyle(color: mutedTextColor, fontSize: Responsive.text(context, 13))),
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
                      style: TextStyle(color: mutedTextColor, fontSize: Responsive.text(context, 12)),
                    ),
                    SizedBox(width: Responsive.value(context, 4)),
                    Icon(Icons.arrow_forward_ios, color: mutedTextColor, size: Responsive.icon(context, 12)),
                  ],
                ),
                SizedBox(height: Responsive.value(context, 8)),

                RichText(
                  text: TextSpan(
                    text: activity.filledAmount,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Responsive.text(context, 13),
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
                SizedBox(height: Responsive.value(context, 4)),

                Text(
                  activity.price,
                  style: TextStyle(color: Colors.white, fontSize: Responsive.text(context, 13)),
                ),
                SizedBox(height: Responsive.value(context, 4)),

                Text(
                  activity.status.label,
                  style: TextStyle(color: statusColor, fontSize: Responsive.text(context, 13)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}