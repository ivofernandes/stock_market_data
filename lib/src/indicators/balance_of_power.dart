import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// A class for calculating the Balance of Power (BOP) indicator in stock market data.
/// BOP is a momentum indicator that measures the strength of buying and selling pressure.
class BalanceOfPower {
  /// Calculates the BOP for a given list of stock prices over a specified period.
  ///
  /// The method calculates the BOP for each price data point and updates the indicators map
  /// with the calculated BOP value.
  ///
  /// Parameters:
  /// - `prices`: A list of `YahooFinanceCandleData` representing the stock data.
  /// - `period`: The period over which the BOP is averaged.
  static void calculateBOP(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate BOP_$period');
    }

    double sum = 0;
    for (int i = 0; i < prices.length; i++) {
      final price = prices[i];
      final double bop = calculateSingleBop(price);
      sum += bop;

      // Calculate the average BOP for the period
      if (i + 1 >= period) {
        if (i - period + 1 > 0) {
          final indexToRemove = i - period;
          final double bopToRemove = calculateSingleBop(prices[indexToRemove]);
          sum -= bopToRemove;
        }
        prices[i].indicators['BOP_$period'] = sum / period;
      }
    }
  }

  /// Helper method to calculate the BOP for a single price data point.
  ///
  /// Parameters:
  /// - `price`: The `YahooFinanceCandleData` for a single price data point.
  ///
  /// Returns the BOP value for the given price data point.
  static double calculateSingleBop(YahooFinanceCandleData price) {
    final double closeMinusOpen = price.close - price.open;
    double highMinusLow = price.high - price.low;

    // Avoid division by zero
    if (highMinusLow == 0) {
      highMinusLow = double.minPositive;
    }

    return closeMinusOpen / highMinusLow;
  }
}
