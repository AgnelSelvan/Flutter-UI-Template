import 'package:crypto_tracker/core/routes/routes.dart';
import 'package:crypto_tracker/views/home/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoTile extends StatelessWidget {
  final CryptoCoin coin;
  const CryptoTile({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, Routes.coinDetails);
      },
      contentPadding: const EdgeInsets.all(10),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: coin.color[200]!.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          coin.iconData,
          color: coin.color[400],
        ),
      ),
      title: Text(
        coin.coinName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      subtitle: Text(
        coin.worth.toString(),
        style: TextStyle(
          color: Colors.white.withOpacity(0.4),
          fontSize: 14,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "\$ ${coin.amount}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 14,
            ),
          ),
          Text(
            "${coin.stockResult.isUp ? '+' : '-'} ${coin.stockResult.percentage}%",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: coin.stockResult.isUp ? Colors.green : Colors.red,
              letterSpacing: 1,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
