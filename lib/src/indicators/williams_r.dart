import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class WilliamsR {
  static void calculateWilliamsR(
      List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a WilliamsR_$period');
    }
    double highestHigh = 0;
    double lowestLow = double.infinity;

    // Roll over the rest of the dataframe
    for (int i = 0; i < prices.length; i++) {
      if (prices[i].high > highestHigh) {
        highestHigh = prices[i].high;
      }
      if (prices[i].low < lowestLow) {
        lowestLow = prices[i].low;
      }
      if (i >= period) {
        highestHigh = 0;
        lowestLow = double.infinity;
        for (int j = i - period; j <= i; j++) {
          if (prices[j].high > highestHigh) {
            highestHigh = prices[j].high;
          }
          if (prices[j].low < lowestLow) {
            lowestLow = prices[j].low;
          }
        }
      }
      prices[i].indicators['%R_$period'] =
          ((highestHigh - prices[i].close) / (highestHigh - lowestLow)) * -100;
    }
  }
}
