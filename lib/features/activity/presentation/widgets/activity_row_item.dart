import 'package:flutter_project_2/core/utils/app_val.dart';
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
      borderRadius: AppVal.borderRadius16(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppVal.padding16(context)),
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
                  fontSize: Responsive.text(context, AppVal.val14),
                ),
              ),
            ),
            AppVal.horizontalSpace16(context),

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
                  AppVal.verticalSpace8(context),
                  Text(
                    Loc.activity.amount,
                    style: TextStyle(
                      color: mutedTextColor,
                      fontSize: Responsive.text(context, 13),
                    ),
                  ),
                  AppVal.verticalSpace4(context),
                  Text(
                    Loc.activity.price,
                    style: TextStyle(
                      color: mutedTextColor,
                      fontSize: Responsive.text(context, 13),
                    ),
                  ),
                  AppVal.verticalSpace4(context),
                  Text(
                    Loc.activity.status,
                    style: TextStyle(
                      color: mutedTextColor,
                      fontSize: Responsive.text(context, 13),
                    ),
                  ),
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
                      style: TextStyle(
                        color: mutedTextColor,
                        fontSize: Responsive.text(context, AppVal.val12),
                      ),
                    ),
                    AppVal.horizontalSpace4(context),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: mutedTextColor,
                      size: Responsive.icon(context, AppVal.val12),
                    ),
                  ],
                ),
                AppVal.verticalSpace8(context),

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
                AppVal.verticalSpace4(context),

                Text(
                  activity.price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Responsive.text(context, 13),
                  ),
                ),
                AppVal.verticalSpace4(context),

                Text(
                  activity.status.label,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: Responsive.text(context, 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
