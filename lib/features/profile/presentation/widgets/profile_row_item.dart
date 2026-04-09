import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';

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
      borderRadius: BorderRadius.circular(Responsive.value(context, 12)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Responsive.padding(context, 24),
          horizontal: Responsive.padding(context, 24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Text(
                  value,
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
          ],
        ),
      ),
    );
  }
}