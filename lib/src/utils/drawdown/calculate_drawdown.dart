import 'dart:math';

import 'package:stock_market_data/src/utils/drawdown/strategy_drawdown.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class CalculateDrawdown {
  /// Calculate the drawdown of the buy and hold strategy_result
  static StrategyDrawdown calculateStrategyDrawdown(
      List<YahooFinanceCandleData> prices) {
    double maxDrawdown = 0;
    double currentDrawdown = 0;
    double allTimeHigh = 0;

    for (int i = 0; i < prices.length; i++) {
      final double high = prices[i].high;
      final double low = prices[i].low;

      // Update drawdown
      if (high > allTimeHigh) {
        allTimeHigh = high;
      } else {
        currentDrawdown = (low / allTimeHigh - 1) * 100;
      }

      maxDrawdown = min(maxDrawdown, currentDrawdown);
    }

    return StrategyDrawdown(
        currentDrawdown: currentDrawdown, maxDrawdown: maxDrawdown);
  }
}
