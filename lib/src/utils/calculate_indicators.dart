import 'package:flutter/material.dart';
import 'package:stock_market_data/src/indicators/ema.dart';
import 'package:stock_market_data/src/indicators/rsi.dart';
import 'package:stock_market_data/src/indicators/sma.dart';
import 'package:stock_market_data/src/indicators/stddev.dart';
import 'package:stock_market_data/src/indicators/vwma.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class CalculateIndicators {
  /// Add indicators values in a list of candle prices
  static void calculateIndicators(
      List<YahooFinanceCandleData> prices, List<String> indicators) {
    // Calculate the indicators one by one
    for (final indicator in indicators) {
      final Map<String, int> indicatorValidated = _validateIndicator(indicator);
      if (indicatorValidated.isNotEmpty) {
        final String indicatorType = indicatorValidated.keys.first;
        final int indicatorPeriod = indicatorValidated[indicatorType]!;

        _calculateIndicator(prices, indicatorType, indicatorPeriod);
      }
    }
  }

  static void _calculateIndicator(
      List<YahooFinanceCandleData> prices, String indicator, int period) {
    switch (indicator) {
      case 'SMA':
        SMA.calculateSMA(prices, period);
        break;
      case 'EMA':
        EMA.calculateEMA(prices, period);
        break;
      case 'RSI':
        RSI.calculateRSI(prices, period);
        break;
      case 'STDDEV':
        STDDEV.calculateSTDDEV(prices, period);
        break;
      case 'VWMA':
        VWMA.calculateVWMA(prices, period);
        break;
    }
  }

  static Map<String, int> _validateIndicator(String indicator) {
    final List<String> indicatorParts = indicator.split('_');

    if (indicatorParts.length == 2) {
      try {
        final period = int.parse(indicatorParts[1]);

        return {indicatorParts[0]: period};
      } catch (e) {
        debugPrint('$indicator is not an indicator!');
      }
    }

    return {};
  }
}
