import 'dart:math';

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

    prices[period - 1].indicators['STDDEV_$period'] =
        sqrt(varianceSum / period);

    for (int i = period; i < prices.length; i++) {
      sum -= prices[i - period].adjClose;
      sum += prices[i].adjClose;

      mean = sum / period;
      varianceSum = 0;
      for (int j = i - period; j <= i; j++) {
        varianceSum += pow(prices[j].adjClose - mean, 2);
      }
      prices[i].indicators['STDDEV_$period'] = sqrt(varianceSum / period);
    }
  }
}
