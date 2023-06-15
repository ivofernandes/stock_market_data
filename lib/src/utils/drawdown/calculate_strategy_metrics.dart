import 'dart:math';

import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// Calculate strategy metrics like CAGR and variation
class CalculateStrategyMetrics {
  static double calculateCAGR(List<YahooFinanceCandleData> candles) {
    final double tradingDays = candles.last.date.difference(candles.first.date).inDays.toDouble();
    final double tradingYears = tradingDays / 365;

    final double variation = calculateVariationRaw(candles);
    final double cagr = (pow(variation, 1 / tradingYears) - 1) * 100;
    return cagr;
  }

  static double calculateVariationRaw(List<YahooFinanceCandleData> candles) => candles.last.close / candles.first.close;

  static double calculateVariation(List<YahooFinanceCandleData> candles) => (calculateVariationRaw(candles) - 1) * 100;
}
