import 'package:flutter/cupertino.dart';

/// Represent an investment instrument
@immutable
class StockTicker {
  /// The symbol of the stock
  final String symbol;

  /// The name description of the stock
  final String? description;

  const StockTicker({
    required this.symbol,
    this.description,
  });

  @override
  bool operator ==(Object other) =>
      other is StockTicker && other.symbol == symbol;

  @override
  String toString() => 'symbol: $symbol > description: $description';

  @override
  int get hashCode => symbol.hashCode;

  StockTicker copyWith({String? symbol, String? description}) => StockTicker(
        symbol: symbol ?? this.symbol,
        description: description ?? this.description,
      );
}
