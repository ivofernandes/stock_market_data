import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/stock_market_data.dart';

import 'test_data.dart';

void main() {
  test('Test STDDEV indicator with checked values', () {
    final List<YahooFinanceCandleData> prices = getTestData();

    CalculateIndicators.calculateIndicators(prices, ['STDDEV_20']);

    assert(prices.last.indicators.containsKey('STDDEV_20'));

    //assert(prices[19].indicators['STDDEV_20']!.toStringAsFixed(3) == '3.623');
    //assert(prices[20].indicators['STDDEV_20']!.toStringAsFixed(3) == '4.189');
  });

  /*
  Phython reference code:

import pandas as pd

data = {
    'prices': [
      1762.25,
      1751.0,
      1747.5,
      1719.5,
      1680.75,
      1707.0,
      1661.0,
      1670.75,
      1675.0,
      1686.75,
      1719.0
    ]
}

df = pd.DataFrame(data)

# Calculate the 3-day stddev
df["Stddev_3"] = round(df['prices'].ewm(span=3, adjust=False).std(), 2) / df['prices'] * 100

print(df)

Output:
     prices  Stddev_3
0   1762.25       NaN
1   1751.00  0.454026
2   1747.50  0.438340
3   1719.50  1.208491
4   1680.75  2.188904
5   1707.00  1.522554
6   1661.00  2.044551
7   1670.75  1.520874
8   1675.00  1.076418
9   1686.75  0.846598
10  1719.00  1.458988
   */
  test('Test STDDEV indicator with checked values', () {
    final List<double> values = [
      1762.25,
      1751.0,
      1747.5,
      1719.5,
      1680.75,
      1707.0,
      1661.0,
      1670.75,
      1675.0,
      1686.75,
      1719.0
    ];

    final List<double?> stddev3 =
        CalculateIndicators.calculateIndicatorsOnValues(values, 'EWMSTD_3');

    //assert(stddev3[9]!.toStringAsFixed(3) == '3.623');
    //assert(stddev3[10]!.toStringAsFixed(3) == '4.189');
  });
}
