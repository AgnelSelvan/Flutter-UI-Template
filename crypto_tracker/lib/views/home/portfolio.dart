import 'package:crypto_tracker/core/res/color.dart';
import 'package:crypto_tracker/views/home/crypto_coin.dart';
import 'package:crypto_tracker/widgets/crypto_tile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 35.h,
            width: 100.w,
            child: Stack(
              children: [
                Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                      gradient: AppColors.getDarkLinearGradient(Colors.indigo),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(40),
                      )),
                  child: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Holding Portfolio",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.7,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "\$ 231.223",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.arrow_upward_rounded,
                                size: 14,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "\$ 5.10",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: CryptoCoin.datas
                          .map(
                            (e) => Container(
                              width: 110,
                              height: 110,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: e.color[50],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Icon(
                                      e.iconData,
                                      color: e.color,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    e.coinName,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$ ${e.amount}",
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        "${e.stockResult.isUp ? '+' : '-'} ${e.stockResult.percentage} %",
                                        style: TextStyle(
                                          color: e.stockResult.isUp
                                              ? Colors.green
                                              : Colors.red,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Recommend to buy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ...CryptoCoin.datas.map((e) => CryptoTile(coin: e)).toList(),
        ],
      ),
    );
  }
}
