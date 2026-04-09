import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/styles/app_colors.dart';
import '../helpers/responsive.dart';

Widget buildHeaderIcon(String path, {BuildContext? ctx}) {
  return Builder(
    builder: (context) {
      final c = ctx ?? context;
      return Transform.scale(
        scale: 1.8,
        child: SvgPicture.asset(
          path,
          colorFilter: const ColorFilter.mode(AppRawColors.primaryDark, BlendMode.srcIn),
          height: Responsive.icon(c, 24),
          width: Responsive.icon(c, 24),
        ),
      );
    },
  );
}