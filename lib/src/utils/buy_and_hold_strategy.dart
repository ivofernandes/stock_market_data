import 'dart:math';

import 'package:stock_market_data/src/indicators/sma.dart';
import 'package:stock_market_data/src/model/strategy/base_strategy_result.dart';
import 'package:stock_market_data/src/model/strategy/buy_and_hold_strategy_result.dart';
import 'package:stock_market_data/src/utils/drawdown/calculate_drawdown.dart';
import 'package:stock_market_data/src/utils/drawdown/strategy_drawdown.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// The `BuyAndHoldStrategy` class provides methods to simulate and analyze a buy and hold strategy
/// using financial data, specifically Yahoo Finance candle data. This strategy involves buying a
/// financial instrument at an initial time point and holding onto it for a certain period, typically
/// until the end of the dataset.
class BuyAndHoldStrategy {
  /// Simulates a buy and hold strategy on a given list of [YahooFinanceCandleData] prices.
  ///
  /// This method analyzes the price data to calculate various metrics such as CAGR, drawdowns, and MAR ratio.
  /// Additionally, it updates the strategy result with moving averages and logs.
  static BuyAndHoldStrategyResult buyAndHoldAnalysis(
      List<YahooFinanceCandleData> prices) {
    final BuyAndHoldStrategyResult strategy =
        BaseStrategyResult.createBuyAndHoldStrategyResult(prices)
            as BuyAndHoldStrategyResult;

    if (prices.isNotEmpty) {
      double buyPrice = _getValidBuyPrice(prices);
      final double sellPrice =
          prices.last.adjClose; // Sell on close of the last day

      strategy
        ..endPrice = sellPrice
        ..previousClosePrice = prices[prices.length - 2].adjClose;

      _calculateStrategyMetrics(prices, buyPrice, sellPrice, strategy);
    }

    strategy.progress = 100;
    _addIndicators(prices, strategy);
    strategy.logs['buyAndHoldEnded'] = DateTime.now();

    return strategy;
  }

  /// Adds current price indicators (SMA) to a [BuyAndHoldStrategyResult].
  ///
  /// The method calculates moving averages for periods of 20, 50, and 200 days.
  static void _addIndicators(
      List<YahooFinanceCandleData> prices, BuyAndHoldStrategyResult strategy) {
    final List<int> periods = [20, 50, 200];
    for (final period in periods) {
      final double movingAverage = SMA.atEnd(prices, period);
      strategy.movingAverages[period] = movingAverage;
    }
  }

  /// Calculates CAGR, drawdown, and MAR of a [BuyAndHoldStrategyResult].
  ///
  /// This method utilizes the buy and sell prices to calculate the Compound Annual Growth Rate (CAGR),
  /// Maximum Drawdown, and the MAR ratio.
  static void _calculateStrategyMetrics(List<YahooFinanceCandleData> prices,
      double buyPrice, double sellPrice, BuyAndHoldStrategyResult strategy) {
    strategy.cagr =
        (pow(sellPrice / buyPrice, 1 / strategy.tradingYears) - 1) * 100;

    final StrategyDrawdown strategyDrawdown =
        CalculateDrawdown.calculateStrategyDrawdown(prices);

    strategy
      ..maxDrawdown = strategyDrawdown.maxDrawdown
      ..currentDrawdown = strategyDrawdown.currentDrawdown
      ..mar = strategy.cagr / strategy.maxDrawdown * -1;
  }

  /// Gets a valid buy price from the first entry of the prices list.
  ///
  /// If the opening price is zero, it uses the closing price as a fallback.
  static double _getValidBuyPrice(List<YahooFinanceCandleData> prices) {
    double buyPrice = prices.first.open;
    if (buyPrice == 0) {
      buyPrice = prices.first.close;
    }
    return buyPrice;
  }
}
