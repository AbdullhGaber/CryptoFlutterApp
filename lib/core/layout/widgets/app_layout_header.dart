import 'package:flutter/material.dart';
import '../../widgets/build_header_icon.dart';
import '../../helpers/responsive.dart';

Widget appLayoutHeader(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.all(Responsive.value(context, 2)),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: CircleAvatar(
          radius: Responsive.value(context, 20),
          backgroundImage: const AssetImage('assets/images/user_avatar.png'),
        ),
      ),
      Row(
        children: [
          buildHeaderIcon('assets/svgs/search.svg'),
          SizedBox(width: Responsive.value(context, 16)),
          buildHeaderIcon('assets/svgs/scan.svg'),
          SizedBox(width: Responsive.value(context, 16)),
          buildHeaderIcon('assets/svgs/notification.svg'),
        ],
      ),
    ],
  );
}