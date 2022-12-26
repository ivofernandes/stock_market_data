import 'package:stock_market_data/src/model/strategy/base_strategy_result.dart';

class BuyAndHoldStrategyResult extends BaseStrategyResult {
  double endPrice = 0;
  Map<int, double> movingAverages = {};
}
