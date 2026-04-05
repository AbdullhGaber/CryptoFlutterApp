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
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
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
                const SizedBox(width: 12),
                Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}