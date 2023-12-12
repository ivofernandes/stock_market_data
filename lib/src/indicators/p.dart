import 'package:stock_market_data/stock_market_data.dart';

/// A class for calculating pivot points and related levels in stock market data.
/// Pivot points are used to identify potential support and resistance levels.
class P {
  /// Calculates pivot points and related support and resistance levels.
  ///
  /// The function modifies the given list of prices by adding calculated indicators.
  /// It computes the pivot point, support levels (S1, S2, S3), and resistance levels (R1, R2, R3).
  ///
  /// Parameters:
  /// - `prices`: A list of `YahooFinanceCandleData` representing the stock data.
  /// - `period`: The period over which the pivot points are calculated.
  static void calculatePVT(List<YahooFinanceCandleData> prices, int period) {
    // Ensure there are enough data points
    if (prices.length < period) {
      throw ArgumentError('Not enough data points for the specified period.');
    }

    for (int i = period; i < prices.length; i++) {
      // Calculate the pivot point
      final previousPrice = prices[i - period];
      final double pivotPoint =
          (previousPrice.high + previousPrice.low + previousPrice.close) / 3;
      prices[i].indicators['P_$period'] = pivotPoint;

      // Calculate the first level of support and resistance
      final double s1 = (2 * pivotPoint) - previousPrice.high;
      final double r1 = (2 * pivotPoint) - previousPrice.low;
      prices[i].indicators['S1_$period'] = s1;
      prices[i].indicators['R1_$period'] = r1;

      // Calculate the second level of support and resistance
      final double s2 = pivotPoint - (previousPrice.high - previousPrice.low);
      final double r2 = pivotPoint + (previousPrice.high - previousPrice.low);
      prices[i].indicators['S2_$period'] = s2;
      prices[i].indicators['R2_$period'] = r2;

      // Calculate the third level of support and resistance
      final double s3 = pivotPoint - (r2 - s2);
      final double r3 = pivotPoint + (r2 - s2);
      prices[i].indicators['S3_$period'] = s3;
      prices[i].indicators['R3_$period'] = r3;
    }
  }
}
