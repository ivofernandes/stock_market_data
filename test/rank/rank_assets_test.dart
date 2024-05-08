import 'package:flutter_test/flutter_test.dart';
import 'package:stock_market_data/src/data/company_tickers.dart';
import 'package:stock_market_data/src/ranks/rank_assets.dart';
import 'package:stock_market_data/src/stock_market_data_service.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

void main() {
  test('Rank assets in sp8', () async {
    final List<String> sp8 = CompaniesTickers.sp500.keys.toList().sublist(0, 8);
    assert(sp8.length == 8);

    final List<String> indicators = ['RSI_14'];
    final Map<String, List<YahooFinanceCandleData>> stockData = {};

    for (final String ticker in sp8) {
      final List<YahooFinanceCandleData> candles = await StockMarketDataService().getCandlesWithIndicators(
        ticker,
        indicators,
        useCache: false,
      );
      stockData[ticker] = candles;
    }

    List<List<String>> ranked = RankAssets.rankByIndicator(stockData, indicators);
  });
}
