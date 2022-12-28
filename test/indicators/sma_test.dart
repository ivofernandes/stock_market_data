import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/stock_market_data.dart';

import 'test_data.dart';

void main() {
  test('Test EMA indicator with checked values', () {
    final List<YahooFinanceCandleData> prices = getTestData();

    CalculateIndicators.calculateIndicators(prices, ['SMA_20']);

    assert(prices.last.indicators.containsKey('SMA_20'));

    assert(prices[19].indicators['SMA_20']!.toStringAsFixed(3) == '2.622');
    assert(prices[20].indicators['SMA_20']!.toStringAsFixed(3) == '2.644');
  });
}
