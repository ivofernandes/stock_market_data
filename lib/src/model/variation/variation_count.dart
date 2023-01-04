/// Auxiliary class to get intervals of variation stuff like:
/// if we got
/// [-1% ... 0%] = 10 days
/// [0%  ... 1%] = 5 days
class VariationCount {
  /// Something that describes the interval of prices
  /// [-1% ... 0%]
  final String intervalDescription;

  /// Number of occurrences inside a specific interval
  final int count;

  VariationCount(
    this.intervalDescription,
    this.count,
  );

  @override
  String toString() => '$intervalDescription = $count';
}
