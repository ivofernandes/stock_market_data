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

  /*
  Phython reference code:

import pandas as pd

data = {
    'prices': [
        122.02596179386423,
        136.90717664677447,
        107.14474694095397,
        232.14695170540023,
        202.3845219995797,
        89.28728911746163,
        267.86186735238493,
        217.26573685249,
    ]
}

df = pd.DataFrame(data)

# Calculate the 7-day EMA
df['ema_7'] = df['prices'].ewm(span=7, adjust=False).mean()

print(df)
Output:
       prices       ema_7
0  122.025962  122.025962
1  136.907177  125.746266
2  107.144747  121.095886
3  232.146952  148.858652
4  202.384522  162.240120
5   89.287289  144.001912
6  267.861867  174.966901
7  217.265737  185.541610
   */
  test('Test of EMA against python data rolling data 7', () {
    final List<double> values = [
      122.02596179386423,
      136.90717664677447,
      107.14474694095397,
      232.14695170540023,
      202.3845219995797,
      89.28728911746163,
      267.86186735238493,
      217.26573685249,
    ];

    final ema =
        CalculateIndicators.calculateIndicatorsOnValues(values, 'EMA_7');

    assert(ema[5] == 144.0019120873905);
    assert(ema[6] == 174.9669009036391);
    assert(ema[7] == 185.54160989085182);
  });
}
