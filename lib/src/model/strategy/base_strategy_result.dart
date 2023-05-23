import 'dart:collection';

import 'package:stock_market_data/src/model/strategy/buy_and_hold_strategy_result.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// Object that contains the result of a strategy
class BaseStrategyResult {
  /// Percentage of strategy_result executed
  int progress = 0;

  /// Start date of the strategy
  DateTime? startDate;

  /// End date of the strategy
  DateTime? endDate;

  /// Number of trading years
  double tradingYears = 0;

  /// Return of the strategy
  double cagr = 0;

  /// Maximum drawdown of the strategy
  double maxDrawdown = 0;

  /// MAR ratio of the strategy: CAGR / maxDrawdown
  double mar = 0;

  /// Current drawdown of the strategy
  double currentDrawdown = 0;

  ///
  LinkedHashMap<String, DateTime> logs = LinkedHashMap();

  /// Number of trades in the strategy
  int tradesNum = 0;

  @override
  String toString() => 'CAGR: $cagr , drawdown: $maxDrawdown, MAR: $mar';

  BaseStrategyResult();

  factory BaseStrategyResult.createBuyAndHoldStrategyResult(
      List<YahooFinanceCandleData> prices) {
    final BuyAndHoldStrategyResult strategy = BuyAndHoldStrategyResult();
    addBaseDataToStrategy(strategy, prices);

    return strategy;
  }

  static void addBaseDataToStrategy(
      BaseStrategyResult strategy, List<YahooFinanceCandleData> prices) {
    strategy.logs['start'] = DateTime.now();

    if (prices.isNotEmpty) {
      addTimeToStrategy(prices, strategy);
    }
  }

  /// Add start, end date and trading years to a strategy_result,
  /// note that the time comes in seconds since 1970
  static void addTimeToStrategy(
      List<YahooFinanceCandleData> prices, BaseStrategyResult strategy) {
    // Get the start and end date, and the total trading years
    final DateTime endDate = prices.last.date;
    final DateTime startDate = prices.first.date;
    final double tradingDays = endDate.difference(startDate).inDays.toDouble();
    final double tradingYears = tradingDays / 365;
    strategy.startDate = startDate;
    strategy.endDate = endDate;
    strategy.tradingYears = tradingYears;
  }
}
