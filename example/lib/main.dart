import 'package:flutter/material.dart';
import 'package:stock_market_data/stock_market_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Market Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: BuyAndHoldResult(),
      ),
    );
  }
}

class BuyAndHoldResult extends StatefulWidget {
  const BuyAndHoldResult({super.key});

  @override
  State<BuyAndHoldResult> createState() => _BuyAndHoldResultState();
}

class _BuyAndHoldResultState extends State<BuyAndHoldResult> {
  final TextEditingController controller = TextEditingController(
    text: 'GOOG',
  );
  BuyAndHoldStrategyResult backTest = BuyAndHoldStrategyResult();
  bool loading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Ticker from yahoo finance'),
        TextField(
          controller: controller,
        ),
        MaterialButton(
          onPressed: load,
          color: Theme.of(context).primaryColor,
          child: const Text('Load'),
        ),
        Expanded(
          child: error != ''
              ? Text('Error: $error')
              : loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        _BackTestResult(backTest),
                        MaterialButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  _IndicatorsData(controller.text),
                            ),
                          ),
                          color: Colors.teal,
                          child: Text('Indicators'),
                        )
                      ],
                    ),
        ),
      ],
    );
  }

  void load() async {
    try {
      error = '';
      loading = true;
      setState(() {});

      backTest = await StockMarketDataService()
          .getBackTestResultForSymbol(controller.text);
      loading = false;
      setState(() {});
    } catch (e) {
      error = 'Error getting the symbol ${controller.text}:\n $e';
      setState(() {});
    }
  }
}

class _BackTestResult extends StatelessWidget {
  final BuyAndHoldStrategyResult backTest;
  const _BackTestResult(this.backTest);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Text('CAGR')),
            Expanded(child: Text(backTest.cagr.toStringAsFixed(2))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(child: Text('Max Drawdown')),
            Expanded(child: Text(backTest.maxDrawdown.toStringAsFixed(2))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(child: Text('MAR')),
            Expanded(child: Text(backTest.mar.toStringAsFixed(2))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(child: Text('Trading years')),
            Expanded(child: Text(backTest.tradingYears.toStringAsFixed(2))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(child: Text('Start date')),
            Expanded(child: Text(backTest.startDate.toString())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(child: Text('End date')),
            Expanded(child: Text(backTest.endDate.toString())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(child: Text('Current drawdown')),
            Expanded(child: Text(backTest.currentDrawdown.toStringAsFixed(2))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(child: Text('End price')),
            Expanded(child: Text(backTest.endPrice.toStringAsFixed(2))),
          ],
        ),
      ],
    );
  }
}

class _IndicatorsData extends StatefulWidget {
  final String symbol;
  const _IndicatorsData(
    this.symbol,
  );

  @override
  State<_IndicatorsData> createState() => _IndicatorsDataState();
}

class _IndicatorsDataState extends State<_IndicatorsData> {
  final TextEditingController indicatorsController = TextEditingController(
    text: 'SMA_20,EMA_20,RSI_20',
  );

  List<YahooFinanceCandleData> prices = [];

  void load() async {
    prices = await StockMarketDataService().getCandlesWithIndicators(
      widget.symbol,
      indicatorsController.text.split(','),
    );

    // Reverse to show in a list
    prices = prices.reversed.toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indicators'),
      ),
      body: ListView.builder(
        itemCount: prices.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text('Indicators'),
                  TextField(
                    controller: indicatorsController,
                  ),
                  MaterialButton(
                    onPressed: load,
                    color: Theme.of(context).primaryColor,
                    child: const Text('Load'),
                  ),
                ],
              ),
            );
          }
          final i = index - 1;
          return _PriceWithIndicators(prices[i]);
        },
      ),
    );
  }
}

class _PriceWithIndicators extends StatelessWidget {
  final YahooFinanceCandleData candle;

  const _PriceWithIndicators(
    this.candle,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Date: ${candle.date}'),
            Text('Close: ${candle.close}'),
            Column(
                children: candle.indicators.keys
                    .map((key) => Text(
                        '$key: ${candle.indicators[key]?.toStringAsFixed(2)}'))
                    .toList())
          ],
        ),
      ),
    );
  }
}