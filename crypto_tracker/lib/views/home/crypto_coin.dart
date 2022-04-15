import 'dart:convert';

import 'package:crypto_tracker/models/stock_result.dart';
import 'package:flutter/material.dart';

class CryptoCoin {
  String coinName;
  double amount;
  StockResult stockResult;
  double worth;
  IconData iconData;
  MaterialColor color;
  CryptoCoin({
    required this.coinName,
    required this.amount,
    required this.stockResult,
    required this.worth,
    required this.iconData,
    required this.color,
  });

  CryptoCoin copyWith({
    String? coinName,
    double? amount,
    StockResult? stockResult,
    double? worth,
    IconData? iconData,
    MaterialColor? color,
  }) {
    return CryptoCoin(
      coinName: coinName ?? this.coinName,
      amount: amount ?? this.amount,
      stockResult: stockResult ?? this.stockResult,
      worth: worth ?? this.worth,
      iconData: iconData ?? this.iconData,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'coinName': coinName,
      'amount': amount,
      'stockResult': stockResult.toMap(),
      'worth': worth,
      'iconData': iconData.codePoint,
      'color': color.value,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CryptoCoin(coinName: $coinName, amount: $amount, stockResult: $stockResult, worth: $worth, iconData: $iconData, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoCoin &&
        other.coinName == coinName &&
        other.amount == amount &&
        other.stockResult == stockResult &&
        other.worth == worth &&
        other.iconData == iconData &&
        other.color == color;
  }

  @override
  int get hashCode {
    return coinName.hashCode ^
        amount.hashCode ^
        stockResult.hashCode ^
        worth.hashCode ^
        iconData.hashCode ^
        color.hashCode;
  }

  static List<CryptoCoin> datas = [
    CryptoCoin(
      coinName: "BTC",
      amount: 21.1,
      stockResult: StockResult(isUp: true, percentage: 3.23),
      worth: 16723.23,
      iconData: Icons.currency_bitcoin_sharp,
      color: Colors.orange,
    ),
    CryptoCoin(
      coinName: "AAVE",
      amount: 4.1,
      stockResult: StockResult(isUp: false, percentage: 5.23),
      worth: 432.23,
      iconData: Icons.biotech_outlined,
      color: Colors.green,
    ),
    CryptoCoin(
      coinName: "BNB",
      amount: 12.1,
      stockResult: StockResult(isUp: false, percentage: 17),
      worth: 3233.23,
      iconData: Icons.border_vertical_outlined,
      color: Colors.blue,
    ),
    CryptoCoin(
      coinName: "ETH",
      amount: 17.1,
      stockResult: StockResult(
        isUp: true,
        percentage: 9,
      ),
      worth: 233.23,
      iconData: Icons.currency_bitcoin_sharp,
      color: Colors.red,
    ),
    CryptoCoin(
      coinName: "XRP",
      amount: 34.1,
      stockResult: StockResult(
        isUp: true,
        percentage: 2,
      ),
      worth: 233.23,
      iconData: Icons.batch_prediction,
      color: Colors.yellow,
    ),
    CryptoCoin(
      coinName: "BZRX",
      amount: 17.1,
      stockResult: StockResult(
        isUp: false,
        percentage: 9,
      ),
      worth: 233.23,
      iconData: Icons.currency_bitcoin_sharp,
      color: Colors.amber,
    ),
  ];
}
