import 'package:stock_market_data/src/indicators/sma.dart';
import 'package:stock_market_data/src/indicators/stddev.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class BollingerBands {
  static void calculateBollingerBands(
      List<YahooFinanceCandleData> prices, int period) {
    SMA.calculateSMA(prices, period);
    STDDEV.calculateSTDDEV(prices, period);

    for (int i = 0; i < prices.length; i++) {
      final indicators = prices[i].indicators;
      final smaKey = 'SMA_$period';
      final stddevKey = 'STDDEV_$period';

      if (indicators.containsKey(smaKey) && indicators.containsKey(stddevKey)) {
        final sma = indicators[smaKey]!;
        final stddev = indicators[stddevKey]!;

        indicators['Bollinger_Upper_$period'] = sma + (stddev * 2);
        indicators['Bollinger_Lower_$period'] = sma - (stddev * 2);
      }
    }
  }
}
