import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

List<YahooFinanceCandleData> getTestData() {
  const closes = [
    2.4991331100463867,
    2.697638988494873,
    2.7247869968414307,
    2.611959934234619,
    2.640104055404663,
    2.687675952911377,
    2.6438400745391846,
    2.540726900100708,
    2.5496931076049805,
    2.4968910217285156,
    2.528273105621338,
    2.490912914276123,
    2.5300168991088867,
    2.547950029373169,
    2.548198938369751,
    2.6234169006347656,
    2.677464008331299,
    2.7768421173095703,
    2.789544105529785,
    2.8386099338531494,
    2.9262819290161133
  ];

  DateTime date = DateTime(2004, 8, 19);

  final List<YahooFinanceCandleData> prices = [];
  for (final close in closes) {
    prices.add(
      YahooFinanceCandleData(
        date: date,
        adjClose: close,
      ),
    );

    date = date.add(
      const Duration(days: 1),
    );
  }

  return prices;
}
