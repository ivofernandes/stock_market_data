import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/src/indicators/ema.dart';
import 'package:stock_market_data/stock_market_data.dart';

import 'test_data.dart';

void main() {
  test('Test EMA indicator with checked values', () {
    final List<YahooFinanceCandleData> prices = getTestData();

    final double ema20 = EMA.atEnd(prices, 20);

    assert(ema20.toStringAsFixed(3) == '2.658');

    CalculateIndicators.calculateIndicators(prices, ['EMA_20']);

    assert(prices.last.indicators.containsKey('EMA_20'));
    assert(prices.last.indicators['EMA_20']!.toStringAsFixed(3) == '2.658');
  });

  test('Test EMA indicator with checked values', () {
    final List<YahooFinanceCandleData> prices = getTestData();
    final List<double> values = prices.map((e) => e.adjClose).toList();

    final List<double?> ema =
        CalculateIndicators.calculateIndicatorsOnValues(values, 'EMA_20');

    assert(ema.last!.toStringAsFixed(3) == '2.658');
  });

  test('Test of EMA against python data rolling data', () {
    final List<double> values = [100, 105, 110, 115, 120];
    final List<double?> ema =
        CalculateIndicators.calculateIndicatorsOnValues(values, 'EMA_3');

    assert(ema[2] == 106.25);
    assert(ema[3] == 110.625);
    assert(ema[4] == 115.3125);
  });
}
