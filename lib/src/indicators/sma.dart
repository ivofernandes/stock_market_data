import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// A class for calculating the Simple Moving Average (SMA).
class SMA {
  /// Calculates the Simple Moving Average at the end of a given list of prices.
  ///
  /// The function takes a list of [YahooFinanceCandleData] and an [int] period to calculate the SMA.
  /// Returns the SMA as a [double].
  static double atEnd(List<YahooFinanceCandleData> prices, int period) {
    double sum = 0;

    for (int i = prices.length - 1; i > 0 && i >= prices.length - period; i--) {
      sum += prices[i].adjClose;
    }

    return sum / period;
  }

  /// Calculates and applies the Simple Moving Average to each element in a list of prices.
  ///
  /// The function modifies the provided list of [YahooFinanceCandleData] by calculating and
  /// storing the SMA within each data point. Takes a list of prices and an [int] period for
  /// calculating SMA.
  static void calculateSMA(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a SMA_$period');
    }
    double sum = 0;
    double sma = 0;

    // Calculate the first sum
    for (int j = period - 1; j >= 0; j--) {
      sum += prices[j].adjClose;
    }
    // Calculate the SMA for the first calculable group of prices
    sma = sum / period;
    prices[period - 1].indicators['SMA_$period'] = sma;

    // Roll over the rest of the dataframe
    for (int i = period; i < prices.length; i++) {
      // subtract the element that with come out of the period
      sum -= prices[i - period].adjClose;
      // Add the new element
      sum += prices[i].adjClose;

      // Calculate the SMA
      sma = sum / period;
      prices[i].indicators['SMA_$period'] = sma;
    }
  }
}
