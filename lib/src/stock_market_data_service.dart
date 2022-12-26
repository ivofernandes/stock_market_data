import 'package:stock_market_data/src/model/strategy/buy_and_hold_strategy_result.dart';
import 'package:stock_market_data/src/utils/buy_and_hold_strategy.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class StockMarketDataService {
  // Singleton
  static final StockMarketDataService _singleton =
      StockMarketDataService._internal();
  factory StockMarketDataService() => _singleton;
  StockMarketDataService._internal();

  Future<BuyAndHoldStrategyResult> getBackTestResultForSymbol(
      String symbol) async {
    final YahooFinanceResponse response =
        await const YahooFinanceDailyReader().getDailyDTOs(symbol);

    return BuyAndHoldStrategy.buyAndHoldAnalysis(response.candlesData);
  }
}
