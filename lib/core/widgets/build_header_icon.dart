import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/styles/app_colors.dart';

Widget buildHeaderIcon(String path) {
  return Transform.scale(
      scale: 1.8,
      child: SvgPicture.asset(
        path,
        colorFilter: const ColorFilter.mode(AppRawColors.primaryDark, BlendMode.srcIn),
        height: 24,
        width: 24,
      )
  );
}