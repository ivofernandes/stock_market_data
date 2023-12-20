import 'dart:math';

/// Class to calculate statistics of a list: mean, standard deviation
abstract class ListStats {
  static double calculateMean(List<double> list) {
    double sum = 0;

    list.forEach((value) {
      sum += value;
    });

    return sum / list.length;
  }

  static double calculateStdDev(List<double> list) {
    final double mean = calculateMean(list);
    return calculateStdDevWithMean(list, mean);
  }

  static double calculateStdDevWithMean(List<double> list, double mean) {
    double sum = 0;

    list.forEach((value) {
      sum += pow(value - mean, 2);
    });

    return sqrt(sum / (list.length - 1));
  }
}
