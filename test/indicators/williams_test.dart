import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/stock_market_data.dart';

import 'test_data.dart';

void main() {
  test('Test Williams indicator with checked values', () {
    final List<YahooFinanceCandleData> prices = getTestData();

    CalculateIndicators.calculateIndicators(prices, ['%R_20']);

    assert(prices.last.indicators.containsKey('%R_20'));

    assert(prices[19].indicators['%R_20']!.toStringAsFixed(3) == '-100.000');
    assert(prices[20].indicators['%R_20']!.toStringAsFixed(3) == '-100.000');
  });
}
