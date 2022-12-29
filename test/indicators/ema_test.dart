import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/src/indicators/ema.dart';
import 'package:stock_market_data/stock_market_data.dart';

import 'test_data.dart';

void main() {
  test('Test EMA indicator with checked values', () {
    final List<YahooFinanceCandleData> prices = getTestData();

    final double ema20 = EMA.atEnd(prices, 20);

    assert(ema20.toStringAsFixed(3) == '2.651');

    CalculateIndicators.calculateIndicators(prices, ['EMA_20']);

    assert(prices.last.indicators.containsKey('EMA_20'));
    assert(prices.last.indicators['EMA_20']!.toStringAsFixed(3) == '2.651');
  });
}
