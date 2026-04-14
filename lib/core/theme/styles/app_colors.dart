import 'package:flutter/material.dart';

class AppColors {
  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color secondary(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;

  static Color background(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color surface(BuildContext context) =>
      Theme.of(context).colorScheme.surface;

  static Color error(BuildContext context) =>
      Theme.of(context).colorScheme.error;

  static Color icon(BuildContext context) =>
      Theme.of(context).iconTheme.color ?? Colors.white;

  static Color card(BuildContext context) => Theme.of(context).cardColor;

  static Color primaryText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
      ? AppRawColors.textPrimaryLight
      : AppRawColors.textPrimaryDark;

  static Color secondaryText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
      ? AppRawColors.textSecondaryLight
      : AppRawColors.textSecondaryDark;

  static Color shadow(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
      ? AppRawColors.shadowLight
      : AppRawColors.shadowDark;
}

class AppRawColors {
  // ================= DARK (primary theme) =================
  static const Color primaryDark = Color(0xFF5ED5A8);
  static const Color secondaryDark = Color(0xFF6EC4A1);
  static const Color backgroundDark = Color(0xFF1B232A);
  static const Color surfaceDark = Color(0xFF161C22);
  static const Color surfaceVariantDark = Color(0xFF262A34);
  static const Color splashDark = Color(0xFF131B24);
  static const Color errorDark = Color(0xFFDD4B4B);
  static const Color successDark = Color(0xFF34A853);
  static const Color warningDark = Color(0xFFF7931A);
  static const Color favoriteDark = Color(0xFFFFCA28);

  static const Color cardDark = Color(0xFF212931);

  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFA0A5BA);

  static const Color iconDark = Color(0xFFA0A5BA);
  static const Color shadowDark = Color(0x0DFFFFFF);

  // ================= LIGHT =================
  static const Color primaryLight = Color(0xFF6EC4A1);
  static const Color secondaryLight = Color(0xFF5ED5A8);
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF1F4F6);
  static const Color errorLight = Color(0xFFDD4B4B);
  static const Color successLight = Color(0xFF34A853);
  static const Color warningLight = Color(0xFFF7931A);
  static const Color favoriteLight = Color(0xFFFFCA28);

  static const Color cardLight = Color(0xFFFFFFFF);

  static const Color textPrimaryLight = Color(0xFF1B232A);
  static const Color textSecondaryLight = Color(0xFF777777);

  static const Color iconLight = Color(0xFF777777);
  static const Color shadowLight = Color(0x0D000000);
}
