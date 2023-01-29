import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/src/indicators/balance_of_power.dart';
import 'package:stock_market_data/stock_market_data.dart';

void main() {
  test('Test Balance of power indicator with checked values', () {
    final DateTime date = DateTime(2004, 8, 19);
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
    BalanceOfPower.calculateBOP(prices, 1);
    BalanceOfPower.calculateBOP(prices, 3);
    assert(prices[0].indicators['BOP_1'] == 1.6);
    assert(prices[2].indicators['BOP_3'] == 10.8);
    assert(prices[3].indicators['BOP_3'] == 15.799999999999999);
  });
}
