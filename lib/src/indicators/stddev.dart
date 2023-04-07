import 'dart:math';

import 'package:stock_market_data/src/indicators/ema.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class STDDEV {
  static double atEnd(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a STDDEV_$period');
    }

    double mean = 0;
    double sum = 0;

    for (int i = prices.length - 1; i > 0 && i >= prices.length - period; i--) {
      mean += prices[i].adjClose;
    }
    mean /= period;

    for (int i = prices.length - 1; i > 0 && i >= prices.length - period; i--) {
      sum += pow(prices[i].adjClose - mean, 2);
    }

    return sqrt(sum / (period - 1));
  }

  static void calculateSTDDEV(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a STDDEV_$period');
    }

    double sum = 0;
    double mean = 0;
    double varianceSum = 0;

    for (int j = 0; j < period; j++) {
      sum += prices[j].adjClose;
    }
    mean = sum / period;
    for (int j = 0; j < period; j++) {
      varianceSum += pow(prices[j].adjClose - mean, 2);
    }

    double absoluteStddev = sqrt(varianceSum / period);
    prices[period - 1].indicators['STDDEV_$period'] =
        absoluteStddev / prices[period - 1].adjClose * 100;

    for (int i = period; i < prices.length; i++) {
      sum -= prices[i - period].adjClose;
      sum += prices[i].adjClose;

      mean = sum / period;
      varianceSum = 0;
      for (int j = i - period; j <= i; j++) {
        varianceSum += pow(prices[j].adjClose - mean, 2);
      }

      absoluteStddev = sqrt(varianceSum / period);
      prices[i].indicators['STDDEV_$period'] =
          absoluteStddev / prices[i].adjClose * 100;
    }
  }

  static void calculateEMASTDDEV(
      List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate an EMSTDDEV_$period');
    }

    final double alpha = 2 / (period + 1.0);
    double ema = prices[0].adjClose;
    double emaVariance = 0;

    for (int i = 1; i < prices.length; i++) {
      final double price = prices[i].adjClose;
      final double prevEma = ema;
      ema = alpha * price + (1 - alpha) * prevEma;

      final double emaDiff = price - prevEma;
      emaVariance = alpha * (emaDiff * emaDiff) + (1 - alpha) * emaVariance;

      if (i >= period - 1) {
        double emaStddev = sqrt(emaVariance);
        prices[i].indicators['EMASTDDEV_$period'] = emaStddev / price * 100;
      }
    }
  }

  static void calculateEWMSTD(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate an EWMSTD_$period');
    }

    EMA.calculateEMA(prices, period);

    final double alpha = 1 - 2 / (period + 1.0);
    double mean = prices[0].indicators['EMA_$period'] ?? prices[0].adjClose;
    double squaredDiffSum = 0.0;

    for (int i = 1; i < prices.length; i++) {
      if (!prices[i].indicators.containsKey('EMA_$period')) {
        continue;
      }
      final double ema = prices[i].indicators['EMA_$period']!;
      final double prevMean = mean;
      mean = alpha * ema + (1 - alpha) * prevMean;
      final double diff = ema - prevMean;
      squaredDiffSum = alpha * (diff * diff) + (1 - alpha) * squaredDiffSum;

      if (i >= period - 1) {
        final double ewmStd = sqrt(squaredDiffSum);
        prices[i].indicators['EWMSTD_$period'] = ewmStd / ema * 100;
      }
    }
  }
}
