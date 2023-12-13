import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// A class for calculating the Money Flow Index (MFI) in stock market data.
/// MFI is a volume-weighted version of the Relative Strength Index (RSI).
class MFI {
  /// Calculates the MFI for a given list of stock prices over a specified period.
  ///
  /// The method calculates the MFI for each price data point and updates the indicators map
  /// with the calculated MFI value.
  ///
  /// Parameters:
  /// - `prices`: A list of `YahooFinanceCandleData` representing the stock data.
  /// - `period`: The number of periods over which to calculate the MFI.
  static void calculateMFI(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate MFI_$period');
    }

    // Calculate typical price for each day
    for (int i = 0; i < prices.length; i++) {
      final double typicalPrice =
          (prices[i].high + prices[i].low + prices[i].close) / 3;
      prices[i].indicators['typicalPrice'] = typicalPrice;
    }

    // Calculate MFI
    for (int i = period; i < prices.length; i++) {
      double positiveMoneyFlow = 0;
      double negativeMoneyFlow = 0;
      for (int j = i - period + 1; j <= i; j++) {
        final double currentTypicalPrice =
            prices[j].indicators['typicalPrice']!;
        final double previousTypicalPrice =
            prices[j - 1].indicators['typicalPrice']!;
        final double moneyFlow = currentTypicalPrice * prices[j].volume;

        // Compare with previous day's typical price to determine flow direction
        if (currentTypicalPrice > previousTypicalPrice) {
          positiveMoneyFlow += moneyFlow;
        } else {
          negativeMoneyFlow += moneyFlow;
        }
      }

      // Avoid division by zero
      if (negativeMoneyFlow == 0) {
        negativeMoneyFlow = double.minPositive;
      }

      final double moneyRatio = positiveMoneyFlow / negativeMoneyFlow;
      prices[i].indicators['MFI_$period'] = 100 - (100 / (1 + moneyRatio));
    }
  }
}
