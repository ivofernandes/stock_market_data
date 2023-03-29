import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/stock_market_data.dart';

import 'test_data.dart';

void main() {
  test('Test STDDEV indicator with checked values', () {
    final List<YahooFinanceCandleData> prices = getTestData();

    CalculateIndicators.calculateIndicators(prices, ['STDDEV_20']);

    assert(prices.last.indicators.containsKey('STDDEV_20'));

    assert(prices[19].indicators['STDDEV_20']!.toStringAsFixed(3) == '3.623');
    assert(prices[20].indicators['STDDEV_20']!.toStringAsFixed(3) == '4.189');
  });
}
