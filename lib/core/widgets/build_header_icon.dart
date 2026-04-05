import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

Widget buildHeaderIcon(String path) {
  return Transform.scale(
      scale: 1.8,
      child: SvgPicture.asset(
        path,
        colorFilter: const ColorFilter.mode(Color(0xFF5ED5A8), BlendMode.srcIn),
        height: 24,
        width: 24,
      )
  );
}