import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final double radius;

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    this.radius = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Responsive.value(context, 4)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Colors.blueAccent.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: CircleAvatar(
        radius: Responsive.value(context, radius),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}