import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class VWMA {
  static void calculateVWMA(List<YahooFinanceCandleData> prices, int period) {
    if (prices.length < period) {
      throw Exception(
          'The prices list is just ${prices.length} and not enough to calculate a VWMA_$period');
    }
    double sumPrice = 0;
    double sumVolume = 0;
    double vwma = 0;

    // Calculate the first sum
    for (int j = period - 1; j >= 0; j--) {
      sumPrice += prices[j].adjClose * prices[j].volume;
      sumVolume += prices[j].volume;
    }
    // Calculate the VWMA for the first calculable group of prices
    vwma = sumPrice / sumVolume;
    prices[period - 1].indicators['VWMA_$period'] = vwma;

    // Roll over the rest of the dataframe
    for (int i = period; i < prices.length; i++) {
      // subtract the element that with come out of the period
      sumPrice -= prices[i - period].adjClose * prices[i - period].volume;
      sumVolume -= prices[i - period].volume;
      // Add the new element
      sumPrice += prices[i].adjClose * prices[i].volume;
      sumVolume += prices[i].volume;

      // Calculate the VWMA
      vwma = sumPrice / sumVolume;
      prices[i].indicators['VWMA_$period'] = vwma;
    }
  }
}
