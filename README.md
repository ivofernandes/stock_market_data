# stock_market_data
Package to get base indicators from the stock and base stats like buy and hold CAGR and total drawdown.
The objective of this package is to implement all the complicated math and calculation needed to start working with

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


## Depends on:
yahoo_finance_data_reader to get data from yahoo finance
https://pub.dev/packages/yahoo_finance_data_reader

## Like us on pub.dev
Package url:
https://pub.dev/packages/stock_market_data


## Instruction to publish the package to pub.dev
dart pub publish