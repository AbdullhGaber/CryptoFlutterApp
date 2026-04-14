import 'package:flutter/material.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/localization/loc.dart';

enum TradeType {
  buy,
  sell;

  String get label => this == TradeType.buy ? 'L/B' : 'L/S';

  Color getColor(BuildContext context) {
    return this == TradeType.buy
        ? Theme.of(context).primaryColor
        : AppRawColors.errorDark;
  }
}

enum OrderStatus {
  filled,
  cancelled;

  String get label =>
      this == OrderStatus.filled ? Loc.activity.filled : Loc.activity.cancelled;

  Color getColor(BuildContext context) {
    return this == OrderStatus.filled
        ? Theme.of(context).primaryColor
        : AppRawColors.errorDark;
  }
}

class ActivityModel {
  final TradeType type;
  final String pair;
  final String date;
  final String filledAmount;
  final String totalAmount;
  final String price;
  final OrderStatus status;

  ActivityModel({
    required this.type,
    required this.pair,
    required this.date,
    required this.filledAmount,
    required this.totalAmount,
    required this.price,
    required this.status,
  });
}
