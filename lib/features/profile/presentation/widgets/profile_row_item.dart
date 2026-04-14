import 'package:flutter_project_2/core/utils/app_val.dart';
import 'package:flutter/material.dart';


class ProfileRowItem extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const ProfileRowItem({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppVal.borderRadius12(context),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppVal.padding24(context),
          horizontal: AppVal.padding24(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                Text(value, style: Theme.of(context).textTheme.bodyMedium),
                AppVal.horizontalSpace12(context),
                Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  size: AppVal.icon20(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
