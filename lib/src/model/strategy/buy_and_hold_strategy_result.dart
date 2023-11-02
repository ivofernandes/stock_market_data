import 'package:stock_market_data/src/model/strategy/base_strategy_result.dart';

/// Object that contains the result of a buy and hold strategy
class BuyAndHoldStrategyResult extends BaseStrategyResult {
  /// End price of the strategy
  double endPrice = 0;

  /// Moving averages at the end of the strategy
  Map<int, double> movingAverages = {};

  BuyAndHoldStrategyResult();

  Map<String, dynamic> toJson() => {
        'progress': progress,
        'startDate': startDate.toString(),
        'endDate': endDate.toString(),
        'tradingYears': tradingYears,
        'cagr': cagr,
        'maxDrawdown': maxDrawdown,
        'mar': mar,
        'currentDrawdown': currentDrawdown,
        'tradesNum': tradesNum,
        'endPrice': endPrice,
      };

  factory BuyAndHoldStrategyResult.fromJson(Map<String, dynamic> resultJson) =>
      BuyAndHoldStrategyResult()
        ..progress = resultJson['progress'] as int
        ..startDate = DateTime.parse(resultJson['startDate'] as String)
        ..endDate = DateTime.parse(resultJson['endDate'] as String)
        ..tradingYears = resultJson['tradingYears'] as double
        ..cagr = resultJson['cagr'] as double
        ..maxDrawdown = resultJson['maxDrawdown'] as double
        ..mar = resultJson['mar'] as double
        ..currentDrawdown = resultJson['currentDrawdown'] as double
        ..tradesNum = resultJson['tradesNum'] as int
        ..endPrice = resultJson['endPrice'] as double;
}
