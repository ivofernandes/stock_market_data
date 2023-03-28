import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class EMA {
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

  static void calculateEMA(List<YahooFinanceCandleData> prices, int period) {
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
      prices[i].indicators['EMA_$period'] = ema;
    }
  }
}
