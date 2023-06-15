/// Represents data about how was given year for a specific asset
class YearlyStats {
  /// Year analysed
  int year;

  /// How much did the price changed in percentage
  double variation;

  /// How much was the maximum fall of the asset
  double drawdown;

  YearlyStats({
    required this.year,
    required this.variation,
    required this.drawdown,
  });

  @override
  String toString() => 'BaseStats{year: $year, variation: $variation, drawdown: $drawdown}';
}
