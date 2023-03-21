import 'package:stock_market_data/stock_market_data.dart';

/// Calculate pivot points
class P {
  static void calculatePVT(List<YahooFinanceCandleData> prices, int period) {
    // Skip the first one as we need the previous day data
    for (int i = 1; i < prices.length; i++) {
      // Caclulate the pivot point
      final previousPrice = prices[i - period];
      final double pivotPoint =
          (previousPrice.close + previousPrice.close + previousPrice.open) / 3;
      prices[i].indicators['P_$period'] = pivotPoint;

      // Calculate the S1 and S2
      final double s1 = 2 * pivotPoint - previousPrice.high;
      prices[i].indicators['S1_$period'] = s1;
      final double s2 = pivotPoint - (previousPrice.high - previousPrice.low);
      prices[i].indicators['S2_$period'] = s2;

      // Calculate the R1 and R2
      final double r1 = 2 * pivotPoint - previousPrice.low;
      prices[i].indicators['R1_$period'] = r1;
      final double r2 = pivotPoint + (previousPrice.high - previousPrice.low);
      prices[i].indicators['R2_$period'] = r2;

      // Calculate the S3
      final double s3 = pivotPoint - s2 + r2;
      prices[i].indicators['S3_$period'] = s3;

      // Calculate the R3
      final double r3 = pivotPoint - s2 + r2;
      prices[i].indicators['R3_$period'] = r3;
    }
  }
}
