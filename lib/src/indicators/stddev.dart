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
      sum += (prices[i].adjClose - mean) * (prices[i].adjClose - mean);
    }

    return sqrt(sum / (period - 1));
  }

  static void calculateSTDDEV(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a STDDEV_$period');
    }

    double mean = 0;
    double sum = 0;
    double stddev = 0;

    // Calculate the first mean
    for (int j = period - 1; j >= 0; j--) {
      mean += prices[j].adjClose;
    }
    mean /= period;

    // Calculate the first sum
    for (int j = period - 1; j >= 0; j--) {
      sum += (prices[j].adjClose - mean) * (prices[j].adjClose - mean);
    }

    // Calculate the STDDEV for the first calculable group of prices
    stddev = sqrt(sum / (period - 1));
    prices[period - 1].indicators['STDDEV_$period'] = stddev;

    // Roll over the rest of the dataframe
    for (int i = period; i < prices.length; i++) {
      double oldMean = mean;
      mean = oldMean + (prices[i].adjClose - oldMean) / period;

      // subtract the element that with come out of the period
      sum -= (prices[i - period].adjClose - oldMean) *
          (prices[i - period].adjClose - oldMean);
      // Add the new element
      sum += (prices[i].adjClose - mean) * (prices[i].adjClose - mean);

      // Calculate the STDDEV
      stddev = sqrt(sum / (period - 1));
      prices[i].indicators['STDDEV_$period'] = stddev;
    }
  }
}
