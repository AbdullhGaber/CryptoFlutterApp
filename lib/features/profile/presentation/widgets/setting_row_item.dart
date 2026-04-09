import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';

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
      borderRadius: BorderRadius.circular(Responsive.value(context, 12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Responsive.padding(context, 20)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: Responsive.icon(context, 24),
            ),
            SizedBox(width: Responsive.value(context, 16)),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              trailingText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(width: Responsive.value(context, 12)),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).textTheme.bodyMedium?.color,
              size: Responsive.icon(context, 20),
            ),
          ],
        ),
      ),
    );
  }
}