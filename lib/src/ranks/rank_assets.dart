import 'dart:core';

import 'package:stock_market_data/stock_market_data.dart';

abstract class RankAssets {
  static List<List<String>> rankByIndicator(
      Map<String, List<YahooFinanceCandleData>> stockData, List<String> indicators) {
    // This will hold the final list of lists for rankings per indicator
    List<List<String>> rankings = [];

    // Process each indicator separately
    for (String indicator in indicators) {
      // Create a map to hold the latest value of the indicator for each stock
      Map<String, double> latestValues = {};

      // Iterate over each stock
      for (String stockId in stockData.keys) {
        // Get the list of candle data for this stock
        List<YahooFinanceCandleData> candles = stockData[stockId]!;
        if (candles.isNotEmpty) {
          // We assume the last candle in the list is the most recent one
          YahooFinanceCandleData latestCandle = candles.last;
          // Get the indicator value from the latest candle
          double? indicatorValue = latestCandle.indicators[indicator];
          if (indicatorValue != null) {
            // Store the value along with the stock ID
            latestValues[stockId] = indicatorValue;
          }
        }
      }

      // Sort the stocks by the indicator value in descending order
      List<String> sortedStockIds = latestValues.keys.toList();
      sortedStockIds.sort((a, b) => latestValues[b]!.compareTo(latestValues[a]!));

      // Add the sorted list of stock IDs to the rankings
      rankings.add(sortedStockIds);
    }

    return rankings;
  }
}
