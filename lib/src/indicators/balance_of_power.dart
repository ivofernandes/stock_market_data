import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class BalanceOfPower {
  static void calculateBOP(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a BOP_$period');
    }

    double sum = 0;
    for (int i = 0; i < prices.length; i++) {
      final price = prices[i];
      final double bop = calculateSingleBop(price);
      sum += bop;
      if (i + 1 >= period) {
        if (i - period + 1 > 0) {
          final indexToRemove = i - period;
          final priceToRemove = prices[indexToRemove];
          final double bopToRemove = calculateSingleBop(priceToRemove);
          sum -= bopToRemove;
        }
        prices[i].indicators['BOP_$period'] = sum;
      }
    }
  }

  static double calculateSingleBop(YahooFinanceCandleData price) {
    var closeMinusOpen = price.close - price.open;
    if (closeMinusOpen == 0) {
      closeMinusOpen = double.minPositive;
    }

    var highMinusLow = price.high - price.low;
    if (highMinusLow == 0) {
      highMinusLow = double.minPositive;
    }

    return closeMinusOpen / highMinusLow;
  }
}
