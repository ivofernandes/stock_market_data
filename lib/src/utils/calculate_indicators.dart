import 'package:flutter/material.dart';
import 'package:stock_market_data/src/indicators/balance_of_power.dart';
import 'package:stock_market_data/src/indicators/bollinger_bands.dart';
import 'package:stock_market_data/src/indicators/ema.dart';
import 'package:stock_market_data/src/indicators/mfi.dart';
import 'package:stock_market_data/src/indicators/p.dart';
import 'package:stock_market_data/src/indicators/rsi.dart';
import 'package:stock_market_data/src/indicators/sma.dart';
import 'package:stock_market_data/src/indicators/stddev.dart';
import 'package:stock_market_data/src/indicators/vwma.dart';
import 'package:stock_market_data/src/indicators/williams_r.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

/// Class to calculate the technical indicators
class CalculateIndicators {
  /// Add indicators values in a list of candle prices
  /// Return true if all the indicators were found and calculated
  static bool calculateIndicators(
      List<YahooFinanceCandleData> prices, List<String> indicators) {
    bool allFound = true;

    // Calculate the indicators one by one
    for (final indicator in indicators) {
      final Map<String, int> indicatorValidated = _validateIndicator(indicator);
      if (indicatorValidated.isNotEmpty) {
        final String indicatorType = indicatorValidated.keys.first;
        final int indicatorPeriod = indicatorValidated[indicatorType]!;

        allFound = allFound &&
            _calculateIndicator(prices, indicatorType, indicatorPeriod);
      }
    }
    return allFound;
  }

  /// Calculate the indicator values on a list of prices
  /// Return true if the indicator was found and calculated
  static bool _calculateIndicator(
      List<YahooFinanceCandleData> prices, String indicator, int period) {
    switch (indicator) {
      case 'SMA':
        SMA.calculateSMA(prices, period);
        return true;
      case 'EMA':
        EMA.calculateEMA(prices, period);
        return true;
      case 'RSI':
        RSI.calculateRSI(prices, period);
        return true;
      case 'STDDEV':
        STDDEV.calculateSTDDEV(prices, period);
        return true;
      case 'VWMA':
        VWMA.calculateVWMA(prices, period);
        return true;
      case 'BB':
        BollingerBands.calculateBollingerBands(prices, period);
        return true;
      case '%R':
        WilliamsR.calculateWilliamsR(prices, period);
        return true;
      case 'MFI':
        MFI.calculateMFI(prices, period);
        return true;
      case 'BOP':
        BalanceOfPower.calculateBOP(prices, period);
        return true;
      case 'P':
        P.calculatePVT(prices, period);
        return true;
      default:
        return false;
    }
  }

  /// Calculate the indicators values on a list of values
  static List<double?> calculateIndicatorsOnValues(
      List<double> values, String indicator) {
    final List<double?> calculated = [];

    final Map<String, int> indicatorValidated = _validateIndicator(indicator);

    if (indicatorValidated.isNotEmpty) {
      final String indicatorType = indicatorValidated.keys.first;
      final int indicatorPeriod = indicatorValidated[indicatorType]!;

      // Create a list of prices with the
      final prices = values
          .map(
            (e) => YahooFinanceCandleData(
              adjClose: e,
              date: DateTime(2004),
            ),
          )
          .toList();

      _calculateIndicator(prices, indicatorType, indicatorPeriod);

      calculated.addAll(prices.map((e) => e.indicators.containsKey(indicator)
          ? e.indicators[indicator]!
          : null));
    }

    return calculated;
  }

  /// Validate the indicator string
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
