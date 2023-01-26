import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/src/indicators/mfi.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

void main() {
  group('MFI', () {
    test('calculateMFI() should throw exception if prices list is too small',
        () {
      final prices = <YahooFinanceCandleData>[];
      expect(() => MFI.calculateMFI(prices, 10), throwsException);
    });

    test('calculateMFI() should add typical price to indicators', () {
      final prices = getPrices();

      MFI.calculateMFI(prices, 2);
      expect(prices[0].indicators['typicalPrice'], (10 + 5 + 7) / 3);
      expect(prices[1].indicators['typicalPrice'], (20 + 15 + 17) / 3);
      expect(prices[2].indicators['typicalPrice'], (30 + 25 + 27) / 3);
    });

    test('calculateMFI() should add MFI to indicators', () {
      final prices = getPrices();

      MFI.calculateMFI(prices, 2);
      // The exact MFI value will depend on the specific calculations
      // but it should be a number between 0 and 100
      expect(prices[3].indicators['MFI_2'], greaterThanOrEqualTo(0));
      expect(prices[3].indicators['MFI_2'], lessThanOrEqualTo(100));
    });
  });
}

List<YahooFinanceCandleData> getPrices() {
  DateTime date = DateTime(2004, 8, 19);
  final prices = <YahooFinanceCandleData>[
    YahooFinanceCandleData(
      date: date,
      high: 10,
      low: 5,
      close: 7,
      volume: 1000,
    ),
    YahooFinanceCandleData(
      date: date.add(const Duration(days: 1)),
      high: 20,
      low: 15,
      close: 17,
      volume: 2000,
    ),
    YahooFinanceCandleData(
      date: date.add(const Duration(days: 2)),
      high: 30,
      low: 25,
      close: 27,
      volume: 3000,
    ),
    YahooFinanceCandleData(
      date: date.add(const Duration(days: 3)),
      high: 35,
      low: 30,
      close: 32,
      volume: 1000,
    ),
  ];
  return prices;
}
