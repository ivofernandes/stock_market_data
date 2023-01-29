import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/stock_market_data.dart';

void main() {
  test('Test buy and hold strategy_result', () async {
    final List<YahooFinanceCandleData> prices = [
      YahooFinanceCandleData(
          date: DateTime(2020), volume: 1, open: 1, close: 1, high: 1, low: 1),
      YahooFinanceCandleData(
          date: DateTime(2020, 3),
          volume: 1,
          open: 1,
          close: 1,
          high: 1,
          low: 0.5),
      YahooFinanceCandleData(
          date: DateTime(2020, 6),
          volume: 1,
          open: 1,
          close: 1,
          high: 2,
          low: 1.5),
      YahooFinanceCandleData(
          date: DateTime(2020, 12, 31),
          volume: 1,
          open: 2,
          close: 2,
          high: 2,
          low: 2),
    ];

    final BuyAndHoldStrategyResult strategy =
        BuyAndHoldStrategy.buyAndHoldAnalysis(prices);

    assert(strategy.cagr == 100);
    assert(strategy.maxDrawdown == -50);
    assert(strategy.mar == 2);
    assert(strategy.tradingYears == 1);
  });
}
