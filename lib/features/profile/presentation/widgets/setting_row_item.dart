import 'package:flutter_project_2/core/utils/app_val.dart';
import 'package:flutter/material.dart';


class SettingRowItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailingText;
  final VoidCallback onTap;

  const SettingRowItem({
    super.key,
    required this.icon,
    required this.title,
    required this.trailingText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppVal.borderRadius12(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppVal.padding20(context)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: AppVal.icon24(context),
            ),
            AppVal.horizontalSpace16(context),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(trailingText, style: Theme.of(context).textTheme.bodyMedium),
            AppVal.horizontalSpace12(context),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).textTheme.bodyMedium?.color,
              size: AppVal.icon20(context),
            ),
          ],
        ),
      ),
    );
  }
}
