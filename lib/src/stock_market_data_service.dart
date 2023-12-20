import 'package:stock_market_data/src/model/strategy/buy_and_hold_strategy_result.dart';
import 'package:stock_market_data/src/utils/buy_and_hold_strategy.dart';
import 'package:stock_market_data/src/utils/calculate_indicators.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// Service to get stock market data
class StockMarketDataService {
  // Singleton
  static final StockMarketDataService _singleton =
      StockMarketDataService._internal();

  factory StockMarketDataService() => _singleton;

  StockMarketDataService._internal();

  /// Get a backtest of buy and hold on a given symbol
  Future<BuyAndHoldStrategyResult> getBackTestResultForSymbol(
    String symbol,
  ) async {
    final List<YahooFinanceCandleData> prices =
        await YahooFinanceService().getTickerData(symbol);

    return BuyAndHoldStrategy.buyAndHoldAnalysis(prices);
  }

  /// Get a dataframe for a symbol with the required indicators
  Future<List<YahooFinanceCandleData>> getCandlesWithIndicators(
      String symbol, List<String> indicators) async {
    final List<YahooFinanceCandleData> prices =
        await YahooFinanceService().getTickerData(symbol);

    CalculateIndicators.calculateIndicators(prices, indicators);

    return prices;
  }
}
