import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// A class to calculate the Exponential Moving Average (EMA) for a list of prices.
class EMA {
  /// Calculates the Exponential Moving Average at the end of a given list of prices.
  ///
  /// The function takes a list of [YahooFinanceCandleData] and an [int] period to calculate the EMA.
  /// If the list is shorter than the period, an exception is thrown.
  ///
  /// Returns the EMA as a [double].
  static double atEnd(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a EMA_$period');
    }

    final double alpha = 2 / (period + 1);
    double ema;

    // Initialize the EMA with the first price
    ema = prices[0].adjClose;

    // Calculate the EMA for the rest of the prices
    for (int i = 1; i < prices.length; i++) {
      final double currentPrice = prices[i].adjClose;
      ema = alpha * (currentPrice - ema) + ema;
    }

    return ema;
  }

  /// Calculates and applies the Exponential Moving Average to each element in a list of prices.
  ///
  /// The function modifies the provided list of [YahooFinanceCandleData] by calculating and
  /// storing the EMA within each data point. Takes a list of prices, the [int] period for
  /// calculating EMA, and an optional [bool] adjust parameter (defaults to true).
  ///
  /// This function does not return any value as it modifies the list in place.
  static void calculateEMA(
    List<YahooFinanceCandleData> prices,
    int period, {
    bool adjust = true,
  }) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a EMA_$period');
    }

    final double alpha = 2 / (period + 1.0);
    double ema = prices[0].adjClose;

    // Calculate the EMA for all the prices
    for (int i = 1; i < prices.length; i++) {
      final double currentPrice = prices[i].adjClose;

      ema = alpha * (currentPrice - ema) + ema;

      prices[i].indicators['EMA_$period'] = ema;
    }
  }
}
