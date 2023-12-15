import 'dart:math';

import 'package:stock_market_data/src/model/variation/variation_count.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// A class for analyzing variations in stock market data.
class Variations {
  /// Counts the occurrences of variations within specified intervals.
  ///
  /// Takes [lowerLimit] and [upperLimit] as the range of interest, [step] as the interval size,
  /// a list of [YahooFinanceCandleData] as [data], and [delta] as the period for variation calculation.
  /// Returns a list of [VariationCount] objects representing the count of variations in each interval.
  static List<VariationCount> countByInterval(
      double lowerLimit,
      double upperLimit,
      double step,
      List<YahooFinanceCandleData> data,
      int delta) {
    final int precision = _getPrecision(lowerLimit, upperLimit, step);

    final Map<String, List<double?>> intervals =
        _getIntervals(lowerLimit, upperLimit, step, precision);
    return _countVariationsInIntervals(intervals, data, delta);
  }

  /// Generates a map of intervals for variation analysis.
  static Map<String, List<double?>> _getIntervals(
      double lowerLimit, double upperLimit, double interval, int precision) {
    final Map<String, List<double?>> intervals = {
      '<$lowerLimit%': [null, lowerLimit]
    };

    for (double lowerValue = lowerLimit;
        lowerValue < upperLimit;
        lowerValue += interval) {
      final double upperValue = lowerValue + interval;

      intervals[
          '${lowerValue.toStringAsFixed(precision)}% .. ${upperValue.toStringAsFixed(precision)}%'] = [
        lowerValue,
        upperValue
      ];
    }

    intervals['>$upperLimit%'] = [upperLimit, null];
    return intervals;
  }

  /// Calculates variations over a specified period [delta] and stores them in the [prices] data.
  static List<VariationCount> _countVariationsInIntervals(
      Map<String, List<double?>> intervals,
      List<YahooFinanceCandleData> data,
      int delta) {
    final List<VariationCount> result = [];

    for (final String intervalDescription in intervals.keys) {
      final List<double?> interval = intervals[intervalDescription]!;

      final int count =
          Variations._countVariations(interval[0], interval[1], data, delta);

      result.add(VariationCount(intervalDescription, count));
    }

    return result;
  }

  /// Calculates variations over a specified period [delta] and stores them in the [prices] data.
  static void calculateVariations(
      List<YahooFinanceCandleData> prices, int delta) {
    for (int i = 0; i < prices.length - delta; i++) {
      final double variation =
          (prices[i + delta].close / prices[i].close - 1) * 100;

      prices[i].indicators['var_$delta'] = variation;
    }
  }

  /// Counts variations between optional [lowerLimit] and [upperLimit] in given [data].
  static int _countVariations(double? lowerLimit, double? upperLimit,
      List<YahooFinanceCandleData> data, int delta) {
    final int count = data
        .where((YahooFinanceCandleData candle) =>
            candle.indicators.containsKey('var_$delta') &&
            validLowerLimit(lowerLimit, candle.indicators['var_$delta']!) &&
            validUpperLimit(upperLimit, candle.indicators['var_$delta']!))
        .length;

    return count;
  }

  static bool validLowerLimit(double? lowerLimit, double value) =>
      lowerLimit == null || value >= lowerLimit;

  static bool validUpperLimit(double? upperLimit, double value) =>
      upperLimit == null || value < upperLimit;

  static List<double> extractList(
      List<YahooFinanceCandleData> data, int delta) {
    final List<double?> vars = data
        .map((YahooFinanceCandleData e) => e.indicators['var_$delta'])
        .toList();

    vars.removeWhere((element) => element == null);
    final List<double> v = vars.cast();

    return v;
  }

  /// Get the needed precision to create intervals
  static int _getPrecision(double lowerLimit, double upperLimit, double step) {
    int lowerPrecision = 0;
    final lowerParts = upperLimit.toString().split('.');
    if (lowerParts.length == 2) {
      lowerPrecision = lowerParts[1].length;
    }

    int stepPrecision = 0;
    final stepParts = step.toString().split('.');
    if (stepParts.length == 2) {
      stepPrecision = stepParts[1].length;
    }

    int upperPrecision = 0;
    final upperParts = upperLimit.toString().split('.');
    if (upperParts.length == 2) {
      upperPrecision = upperParts[1].length;
    }

    return max(lowerPrecision, max(stepPrecision, upperPrecision));
  }
}
