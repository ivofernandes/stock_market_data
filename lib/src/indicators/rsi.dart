import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class RSI {
  static void calculateRSI(List<YahooFinanceCandleData> prices, int period) {
    // Initialize variables to track gains and losses, as well as the relative strength (RS)
    double gains = 0;
    double losses = 0;
    double rs;

    // Calculate the difference between the current day's close price and the previous day's close price
    // for each day in the data
    final List<double> diffs = [];
    for (int i = 1; i < prices.length; i++) {
      diffs.add(prices[i].adjClose - prices[i - 1].adjClose);
    }

    // Calculate the average gain and average loss for the given number of periods using a rolling window
    for (int i = 0; i < diffs.length; i++) {
      if (i < period - 1) {
        // For the first few periods, we need to sum the gains and losses
        if (diffs[i] > 0) {
          gains += diffs[i];
        } else {
          losses -= diffs[i];
        }
      } else {
        // For the rest of the periods, we update the sums by adding the current period's gain or loss
        // and subtracting the oldest period's gain or loss
        if (diffs[i] > 0) {
          gains = (gains * (period - 1) + diffs[i]) / period;
          losses = (losses * (period - 1)) / period;
        } else {
          losses = (losses * (period - 1) - diffs[i]) / period;
          gains = (gains * (period - 1)) / period;
        }
      }

      // Calculate the relative strength (RS) for each period by dividing the average gain by the average loss
      if (losses == 0) {
        rs = gains;
      } else {
        rs = gains / losses;
      }

      final index = i + 1;
      if (index >= period) {
        // Calculate the RSI for each period using the formula: RSI = 100 - (100 / (1 + RS))
        final double rsi = 100 - (100 / (1 + rs));
        prices[index].indicators['RSI_$period'] = rsi;
      }
    }
  }
}
