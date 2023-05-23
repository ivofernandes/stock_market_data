import 'package:stock_market_data/src/model/strategy/base_strategy_result.dart';

/// Object that contains the result of a buy and hold strategy
class BuyAndHoldStrategyResult extends BaseStrategyResult {
  /// End price of the strategy
  double endPrice = 0;

  /// Moving averages at the end of the strategy
  Map<int, double> movingAverages = {};
}
