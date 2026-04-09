import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_2/features/market/domain/entities/coin_entity.dart';

Widget buildSparkline(Color trendColor, CoinEntity coin) {
  if (coin.sparkline.isEmpty) return const SizedBox.shrink();
  final spots = coin.sparkline.asMap().entries.map((e) {
    return FlSpot(e.key.toDouble(), e.value);
  }).toList();
  return LineChart(
    LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      lineTouchData: const LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: trendColor,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                trendColor.withValues(alpha: 0.3),
                trendColor.withValues(alpha: 0.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    ),
  );
}