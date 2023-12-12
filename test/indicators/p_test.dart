import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/src/indicators/p.dart';

import 'mfi_test.dart';

void main() {
  group('P', () {
    test('calculateP() should add all pivot points', () {
      final prices = getPrices();

      P.calculatePVT(prices, 1);

      // Validate the pivot points
      expect(prices[0].indicators['P_1'], null);
      expect(prices[0].indicators['S1_1'], null);
      expect(prices[0].indicators['S2_1'], null);
      expect(prices[0].indicators['S3_1'], null);
      expect(prices[0].indicators['R1_1'], null);
      expect(prices[0].indicators['R2_1'], null);
      expect(prices[0].indicators['R3_1'], null);

      expect(prices[1].indicators['P_1'], 7.333333333333333);
      expect(prices[1].indicators['S1_1'], 4.666666666666666);
      expect(prices[1].indicators['S2_1'], 2.333333333333333);
      expect(prices[1].indicators['S3_1'], -2.666666666666667);
      expect(prices[1].indicators['R1_1'], 9.666666666666666);
      expect(prices[1].indicators['R2_1'], 12.333333333333332);
      expect(prices[1].indicators['R3_1'], 17.333333333333332);
    });
  });
}
