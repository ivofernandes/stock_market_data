import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class MFI {
  static void calculateMFI(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a MFI_$period');
    }

    for (int i = 0; i < prices.length; i++) {
      final double typicalPrice =
          (prices[i].high + prices[i].low + prices[i].close) / 3;
      prices[i].indicators['typicalPrice'] = typicalPrice;
    }

    for (int i = 0; i < prices.length; i++) {
      if (i > period) {
        double positiveMoneyFlow = 0;
        double negativeMoneyFlow = 0;
        for (int j = i - period; j <= i; j++) {
          final double typicalPrice = prices[j].indicators['typicalPrice']!;
          final double lastTypicalPrice =
              prices[j - 1].indicators['typicalPrice']!;
          final double moneyFlow = typicalPrice * prices[j].volume;
          if (typicalPrice >= lastTypicalPrice) {
            positiveMoneyFlow += moneyFlow;
          } else {
            negativeMoneyFlow += moneyFlow;
          }
        }
        final double moneyRatio = positiveMoneyFlow / negativeMoneyFlow;
        prices[i].indicators['MFI_$period'] = 100 - (100 / (1 + moneyRatio));
      }
    }
  }
}
