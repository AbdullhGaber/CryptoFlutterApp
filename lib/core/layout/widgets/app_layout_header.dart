import 'package:flutter/material.dart';
import '../../widgets/build_header_icon.dart';

Widget appLayoutHeader(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/user_avatar.png'),
        ),
      ),
      Row(
        children: [
          buildHeaderIcon('assets/svgs/search.svg'),
          const SizedBox(width: 16),
          buildHeaderIcon('assets/svgs/scan.svg'),
          const SizedBox(width: 16),
          buildHeaderIcon('assets/svgs/notification.svg'),
        ],
      ),
    ],
  );
}