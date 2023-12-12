import 'dart:math';

import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// A class for calculating the Williams %R indicator in stock market data.
/// Williams %R is a momentum indicator that measures overbought and oversold levels.
class WilliamsR {
  /// Calculates the Williams %R indicator for the provided list of stock prices.
  ///
  /// The function adds the calculated %R value to the indicators map of each price data point.
  ///
  /// Parameters:
  /// - `prices`: A list of `YahooFinanceCandleData` representing the stock data.
  /// - `period`: The look-back period for calculating the indicator.
  static void calculateWilliamsR(
      List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate WilliamsR_$period');
    }

    for (int i = 0; i < prices.length; i++) {
      double highestHigh = 0;
      double lowestLow = double.infinity;

      // Calculate the highest high and the lowest low for the period
      int startIndex = i - period + 1;
      if (startIndex < 0) {
        startIndex = 0;
      }
      for (int j = startIndex; j <= i; j++) {
        highestHigh = max(highestHigh, prices[j].high);
        lowestLow = min(lowestLow, prices[j].low);
      }

      // Calculate Williams %R
      final double percentR =
          ((highestHigh - prices[i].close) / (highestHigh - lowestLow)) * -100;
      prices[i].indicators['%R_$period'] = percentR;
    }
  }
}
