[![pub package](https://img.shields.io/pub/v/stock_market_data.svg?label=stock_market_data&color=blue)](https://pub.dev/packages/stock_market_data)
[![popularity](https://img.shields.io/pub/popularity/stock_market_data?logo=dart)](https://pub.dev/packages/stock_market_data/score)
[![likes](https://img.shields.io/pub/likes/stock_market_data?logo=dart)](https://pub.dev/packages/stock_market_data/score)
[![pub points](https://img.shields.io/pub/points/sentry?logo=dart)](https://pub.dev/packages/stock_market_data/score)

# stock_market_data
Package to get base indicators from the stock and base stats like buy and hold CAGR and total drawdown.
The objective of this package is to implement all the complicated math and calculation needed to start working with

![Stock market data example screenshot](https://raw.githubusercontent.com/ivofernandes/stock_market_data/master/doc/simulator_screenshot.png?raw=true)
![Stock market data example screenshot with indicators](https://raw.githubusercontent.com/ivofernandes/stock_market_data/master/doc/simulator_screenshot_2.png?raw=true)


## Features
Calculate buy and hold CAGR, Drawdown and MAR based on just a symbol
Add indicators to YahooFinanceCandleData indicators map, indicators supported: SMA, EMA, RSI

This package works as a base for the functionality logic of turing deal.
https://github.com/ivofernandes/turingDealApp

Android:
https://play.google.com/store/apps/details?id=com.turing_deal

iOS:
https://apps.apple.com/us/app/turingdeal-investing-portfolio/id1590934022

## Getting started
Add the dependency to your `pubspec.yaml`:
```
stock_market_data: ^0.0.1
```

## Usage for getting a buy and hold backtest
```dart
BuyAndHoldStrategyResult backTest = await StockMarketDataService().getBackTestResultForSymbol('GOOG');
```

## Usage for getting candles with indicators
```dart
List<YahooFinanceCandleData> prices = await StockMarketDataService().getCandlesWithIndicators('GOOG', ['EMA_20', 'RSI_20']);
```

## All supported indicators
- SMA
- EMA
- RSI
- BB
- BOP
- MFI
- P
- STDDEV
- VWMA
- %R

## Usage for getting candles with all indicators
```dart
List<YahooFinanceCandleData> prices = await StockMarketDataService().getCandlesWithIndicators('GOOG', ['SMA_20,EMA_20,RSI_20,STDDEV_20,VWMA_20,BB_20,%R_20,MFI_14,BOP_14,P_1']);
```


## Depends on:
yahoo_finance_data_reader to get data from yahoo finance
https://pub.dev/packages/yahoo_finance_data_reader

## Like us on pub.dev
Package url:
https://pub.dev/packages/stock_market_data


## Instruction to publish the package to pub.dev
dart pub publish