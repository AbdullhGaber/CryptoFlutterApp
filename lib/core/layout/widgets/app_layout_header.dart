import 'package:flutter_project_2/core/utils/app_assets.dart';
import 'package:flutter_project_2/core/utils/app_val.dart';
import 'package:flutter/material.dart';
import '../../widgets/build_header_icon.dart';
import '../../helpers/responsive.dart';

Widget appLayoutHeader(BuildContext context) {
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
          radius: Responsive.value(context, AppVal.val20),
          backgroundImage: const AssetImage(AppAssets.imagesUserAvatar),
        ),
      ),
      Row(
        children: [
          buildHeaderIcon(AppAssets.svgsSearch),
          AppVal.horizontalSpace16(context),
          buildHeaderIcon(AppAssets.svgsScan),
          AppVal.horizontalSpace16(context),
          buildHeaderIcon(AppAssets.svgsNotification),
        ],
      ),
    ],
  );
}
