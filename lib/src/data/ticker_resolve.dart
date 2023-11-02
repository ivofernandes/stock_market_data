import 'package:stock_market_data/src/data/tickers_list.dart';
import 'package:stock_market_data/src/model/stock_ticker.dart';

class TickerResolve {
  /// Get a description for a ticker
  static String getTickerDescription(StockTicker ticker) {
    if (ticker.description != null && ticker.description!.isNotEmpty) {
      return ticker.description!;
    } else {
      final String symbol = ticker.symbol;

      if (TickersList.sectors[symbol] != null) {
        return TickersList.sectors[symbol]!;
      } else if (TickersList.main[symbol] != null) {
        return TickersList.main[symbol]!;
      } else if (TickersList.bonds[symbol] != null) {
        return TickersList.bonds[symbol]!;
      } else if (TickersList.futures[symbol] != null) {
        return TickersList.futures[symbol]!;
      } else if (TickersList.companies[symbol] != null) {
        return TickersList.companies[symbol]!;
      } else if (TickersList.countries[symbol] != null) {
        return TickersList.countries[symbol]!;
      }

      return symbol;
    }
  }
}
