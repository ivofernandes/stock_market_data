import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/stock_market_data.dart';

import 'test_data.dart';

void main() {
  test('Test RSI indicator with checked values', () {
    final List<YahooFinanceCandleData> prices = getTestData();

    CalculateIndicators.calculateIndicators(prices, ['RSI_20']);

    assert(prices.last.indicators.containsKey('RSI_20'));

    assert(prices[20].indicators['RSI_20']!.toStringAsFixed(3) == '66.479');
  });
}
