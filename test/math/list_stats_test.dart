import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/src/math/list_stats.dart';

void main() {
  group('ListStats Test -', () {
    test('Calculate Mean', () {
      expect(ListStats.calculateMean([1.0, 2.0, 3.0, 4.0, 5.0]), equals(3.0));
    });

    test('Calculate Standard Deviation', () {
      expect(ListStats.calculateStdDev([1.0, 2.0, 3.0, 4.0, 5.0]), closeTo(1.581, 0.001));
    });
  });
}
