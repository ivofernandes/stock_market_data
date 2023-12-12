import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// A class for calculating the Volume Weighted Moving Average (VWMA).
/// VWMA is a trading indicator that averages the price of a security weighted by its volume.
class VWMA {
  /// Calculates VWMA for a given list of stock prices and a specified period.
  ///
  /// The method calculates the VWMA and updates each `YahooFinanceCandleData` object in the list
  /// with the calculated VWMA value in its indicators map.
  ///
  /// Parameters:
  /// - `prices`: A list of `YahooFinanceCandleData` representing the stock data.
  /// - `period`: The number of periods over which to calculate the VWMA.
  static void calculateVWMA(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate VWMA_$period');
    }
    double sumPrice = 0;
    double sumVolume = 0;
    double vwma = 0;

    // Calculate the initial sum for the first period
    for (int j = period - 1; j >= 0; j--) {
      sumPrice += prices[j].adjClose * prices[j].volume;
      sumVolume += prices[j].volume;
    }
    // Calculate the VWMA for the first calculable group of prices
    vwma = sumPrice / sumVolume;
    prices[period - 1].indicators['VWMA_$period'] = vwma;

    // Roll over the rest of the price data
    for (int i = period; i < prices.length; i++) {
      // Update the sums by removing the oldest data point and adding the newest
      sumPrice -= prices[i - period].adjClose * prices[i - period].volume;
      sumVolume -= prices[i - period].volume;
      sumPrice += prices[i].adjClose * prices[i].volume;
      sumVolume += prices[i].volume;

      // Recalculate the VWMA
      vwma = sumPrice / sumVolume;
      prices[i].indicators['VWMA_$period'] = vwma;
    }
  }
}
