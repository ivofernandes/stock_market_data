import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/stock_market_data.dart';

void main() {
  test('Test buy and hold strategy_result', () async {
    final List<YahooFinanceCandleData> prices = [
      YahooFinanceCandleData(
        date: DateTime(2020),
        volume: 1,
        open: 1,
        close: 1,
        high: 1,
        low: 1,
        adjClose: 1,
      ),
      YahooFinanceCandleData(
        date: DateTime(2020, 3),
        volume: 1,
        open: 1,
        close: 1,
        high: 1,
        low: 0.5,
        adjClose: 1,
      ),
      YahooFinanceCandleData(
        date: DateTime(2020, 6),
        volume: 1,
        open: 1,
        close: 1,
        high: 2,
        low: 1.5,
        adjClose: 1,
      ),
      YahooFinanceCandleData(
        date: DateTime(2020, 12, 31),
        volume: 1,
        open: 2,
        close: 2,
        high: 2,
        low: 2,
        adjClose: 2,
      ),
    ];

    final BuyAndHoldStrategyResult strategy =
        BuyAndHoldStrategy.buyAndHoldAnalysis(prices);

    assert(strategy.cagr == 100);
    assert(strategy.maxDrawdown == -50);
    assert(strategy.mar == 2);
    assert(strategy.tradingYears == 1);
  });

  test('Buy and hold from internet', () async {
    const String symbol = 'SRC';
    final List<YahooFinanceCandleData> prices =
        await YahooFinanceService().getTickerData(
      symbol,
      useCache: false,
      adjust: true,
    );

    final BuyAndHoldStrategyResult buyAndHold =
        BuyAndHoldStrategy.buyAndHoldAnalysis(prices);

    basicStrategyValidation(buyAndHold);
  });

  test('Buy and hold for Berkshire', () async {
    const String berkshireTicker = 'BRK-B';
    final bool hasBerkshireTicker =
        TickersList.companies.containsKey(berkshireTicker);
    assert(hasBerkshireTicker);

    final List<YahooFinanceCandleData> prices =
        await YahooFinanceService().getTickerData(
      berkshireTicker,
      useCache: false,
      adjust: true,
    );
    final BuyAndHoldStrategyResult buyAndHold =
        BuyAndHoldStrategy.buyAndHoldAnalysis(prices);

    basicStrategyValidation(buyAndHold);
  });

  test('Buy and hold for Ambev', () async {
    const String ambevTicker = 'ABEV';

    final List<YahooFinanceCandleData> prices =
        await YahooFinanceService().getTickerData(
      ambevTicker,
      useCache: false,
      adjust: true,
    );
    final BuyAndHoldStrategyResult buyAndHold =
        BuyAndHoldStrategy.buyAndHoldAnalysis(prices);

    basicStrategyValidation(buyAndHold);
  });
}

void basicStrategyValidation(BuyAndHoldStrategyResult buyAndHold) {
  assert(buyAndHold.progress == 100);
  assert(buyAndHold.tradingYears > 10);

  assert(!buyAndHold.cagr.isNaN);
  assert(buyAndHold.maxDrawdown.isFinite);

  assert(buyAndHold.mar.isFinite);

  assert(buyAndHold.currentDrawdown.isFinite);
  assert(buyAndHold.endPrice > 0);
  assert(buyAndHold.maxDrawdown < 0);
}
