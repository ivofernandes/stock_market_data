import 'package:stock_market_data/src/indicators/sma.dart';
import 'package:stock_market_data/src/indicators/stddev.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// A class for calculating Bollinger Bands in stock market data.
/// Bollinger Bands are a type of statistical chart characterizing the prices and volatility over time.
class BollingerBands {
  /// Calculates Bollinger Bands for the provided list of stock prices.
  ///
  /// This method first calculates the Simple Moving Average (SMA) and the Standard Deviation (STDDEV)
  /// for the given period. It then uses these values to calculate the upper and lower Bollinger Bands.
  ///
  /// Parameters:
  /// - `prices`: A list of `YahooFinanceCandleData` representing the stock data.
  /// - `period`: The period over which the Bollinger Bands are calculated.
  static void calculateBollingerBands(
      List<YahooFinanceCandleData> prices, int period) {
    // Calculate Simple Moving Average (SMA) and Standard Deviation (STDDEV) for the period
    SMA.calculateSMA(prices, period);
    STDDEV.calculateSTDDEV(prices, period);

    for (int i = 0; i < prices.length; i++) {
      final indicators = prices[i].indicators;
      final smaKey = 'SMA_$period';
      final stddevKey = 'STDDEV_$period';

      // Check if SMA and STDDEV have been calculated
      if (indicators.containsKey(smaKey) && indicators.containsKey(stddevKey)) {
        final sma = indicators[smaKey]!;
        final stddev = indicators[stddevKey]!;

        // Calculate Bollinger Upper and Lower Bands
        indicators['Bollinger_Upper_$period'] = sma + (stddev * 2);
        indicators['Bollinger_Lower_$period'] = sma - (stddev * 2);
      }
    }
  }
}
