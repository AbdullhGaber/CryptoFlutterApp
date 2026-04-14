import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle _primaryTextStyle(
    BuildContext context, {
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: AppColors.primaryText(context),
    );
  }

  static TextStyle _secondaryTextStyle(
    BuildContext context, {
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: AppColors.secondaryText(context),
    );
  }

  static TextStyle light10(BuildContext context) => _secondaryTextStyle(
    context,
    fontSize: _TextFontSizes.f10,
    fontWeight: _TextFontWeights.light,
  );

  static TextStyle regular12(BuildContext context) => _secondaryTextStyle(
    context,
    fontSize: _TextFontSizes.f12,
    fontWeight: _TextFontWeights.regular,
  );

  static TextStyle regular14(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f14,
    fontWeight: _TextFontWeights.regular,
  );

  static TextStyle regular16(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f16,
    fontWeight: _TextFontWeights.regular,
  );

  static TextStyle regular16Secondary(BuildContext context) =>
      _secondaryTextStyle(
        context,
        fontSize: _TextFontSizes.f16,
        fontWeight: _TextFontWeights.regular,
      );

  static TextStyle medium16(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f16,
    fontWeight: _TextFontWeights.medium,
  );

  static TextStyle bold14(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f14,
    fontWeight: _TextFontWeights.bold,
  );

  static TextStyle bold16(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f16,
    fontWeight: _TextFontWeights.bold,
  );

  static TextStyle bold18(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f18,
    fontWeight: _TextFontWeights.bold,
  );

  static TextStyle bold22(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f22,
    fontWeight: _TextFontWeights.bold,
  );

  static TextStyle bold26(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f26,
    fontWeight: _TextFontWeights.bold,
  );

  static TextStyle bold32(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f32,
    fontWeight: _TextFontWeights.bold,
  );

  static TextStyle black26(BuildContext context) => _primaryTextStyle(
    context,
    fontSize: _TextFontSizes.f26,
    fontWeight: _TextFontWeights.black,
  );
}

class _TextFontSizes {
  static const f10 = 10.0;
  static const f12 = 12.0;
  static const f14 = 14.0;
  static const f16 = 16.0;
  static const f18 = 18.0;
  static const f22 = 22.0;
  static const f26 = 26.0;
  static const f32 = 32.0;
}

class _TextFontWeights {
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const bold = FontWeight.w700;
  static const black = FontWeight.w900;
}
