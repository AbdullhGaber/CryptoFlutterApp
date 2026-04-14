import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';

class AppVal {
  AppVal._();

  // ==================== Raw Values ====================
  static const double val4 = 4;
  static const double val8 = 8;
  static const double val10 = 10;
  static const double val12 = 12;
  static const double val14 = 14;
  static const double val16 = 16;
  static const double val18 = 18;
  static const double val20 = 20;
  static const double val24 = 24;
  static const double val32 = 32;
  static const double val46 = 46;
  static const double val64 = 64;

  // ==================== Responsive Padding ====================
  static double padding4(BuildContext context) =>
      Responsive.padding(context, val4);
  static double padding8(BuildContext context) =>
      Responsive.padding(context, val8);
  static double padding10(BuildContext context) =>
      Responsive.padding(context, val10);
  static double padding12(BuildContext context) =>
      Responsive.padding(context, val12);
  static double padding14(BuildContext context) =>
      Responsive.padding(context, val14);
  static double padding16(BuildContext context) =>
      Responsive.padding(context, val16);
  static double padding18(BuildContext context) =>
      Responsive.padding(context, val18);
  static double padding20(BuildContext context) =>
      Responsive.padding(context, val20);
  static double padding24(BuildContext context) =>
      Responsive.padding(context, val24);
  static double padding32(BuildContext context) =>
      Responsive.padding(context, val32);

  // ==================== Responsive Icon Sizes ====================
  static double icon16(BuildContext context) => Responsive.icon(context, val16);
  static double icon20(BuildContext context) => Responsive.icon(context, val20);
  static double icon24(BuildContext context) => Responsive.icon(context, val24);
  static double icon32(BuildContext context) => Responsive.icon(context, val32);
  static double icon46(BuildContext context) => Responsive.icon(context, val46);
  static double icon64(BuildContext context) => Responsive.icon(context, val64);

  // ==================== Responsive Spacing ====================
  static Widget horizontalSpace4(BuildContext context) =>
      SizedBox(width: Responsive.value(context, val4));
  static Widget horizontalSpace8(BuildContext context) =>
      SizedBox(width: Responsive.value(context, val8));
  static Widget horizontalSpace10(BuildContext context) =>
      SizedBox(width: Responsive.value(context, val10));
  static Widget horizontalSpace12(BuildContext context) =>
      SizedBox(width: Responsive.value(context, val12));
  static Widget horizontalSpace16(BuildContext context) =>
      SizedBox(width: Responsive.value(context, val16));
  static Widget horizontalSpace20(BuildContext context) =>
      SizedBox(width: Responsive.value(context, val20));
  static Widget horizontalSpace24(BuildContext context) =>
      SizedBox(width: Responsive.value(context, val24));

  static Widget verticalSpace4(BuildContext context) =>
      SizedBox(height: Responsive.value(context, val4));
  static Widget verticalSpace8(BuildContext context) =>
      SizedBox(height: Responsive.value(context, val8));
  static Widget verticalSpace10(BuildContext context) =>
      SizedBox(height: Responsive.value(context, val10));
  static Widget verticalSpace12(BuildContext context) =>
      SizedBox(height: Responsive.value(context, val12));
  static Widget verticalSpace16(BuildContext context) =>
      SizedBox(height: Responsive.value(context, val16));
  static Widget verticalSpace20(BuildContext context) =>
      SizedBox(height: Responsive.value(context, val20));
  static Widget verticalSpace24(BuildContext context) =>
      SizedBox(height: Responsive.value(context, val24));
  static Widget verticalSpace32(BuildContext context) =>
      SizedBox(height: Responsive.value(context, val32));

  // ==================== Responsive Border Radius ====================
  static BorderRadius borderRadius4(BuildContext context) =>
      BorderRadius.circular(Responsive.value(context, val4));
  static BorderRadius borderRadius8(BuildContext context) =>
      BorderRadius.circular(Responsive.value(context, val8));
  static BorderRadius borderRadius10(BuildContext context) =>
      BorderRadius.circular(Responsive.value(context, val10));
  static BorderRadius borderRadius12(BuildContext context) =>
      BorderRadius.circular(Responsive.value(context, val12));
  static BorderRadius borderRadius16(BuildContext context) =>
      BorderRadius.circular(Responsive.value(context, val16));
  static BorderRadius borderRadius20(BuildContext context) =>
      BorderRadius.circular(Responsive.value(context, val20));
  static BorderRadius borderRadius24(BuildContext context) =>
      BorderRadius.circular(Responsive.value(context, val24));
  static BorderRadius borderRadius32(BuildContext context) =>
      BorderRadius.circular(Responsive.value(context, val32));
}
