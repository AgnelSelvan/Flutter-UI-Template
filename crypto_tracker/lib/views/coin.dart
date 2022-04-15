import 'package:crypto_tracker/models/spline_area.dart';
import 'package:crypto_tracker/views/home/crypto_coin.dart';
import 'package:crypto_tracker/widgets/crypto_tile.dart';
import 'package:crypto_tracker/widgets/custom_graph.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({Key? key}) : super(key: key);

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  List<SplineAreaData>? firstChartData;
  String selectedChart = "1D";

  @override
  void initState() {
    firstChartData = <SplineAreaData>[
      SplineAreaData(2010, 8.53, 3.3),
      SplineAreaData(2011, 9.5, 5.4),
      SplineAreaData(2012, 10, 2.65),
      SplineAreaData(2013, 9.4, 2.62),
      SplineAreaData(2014, 5.8, 1.99),
      SplineAreaData(2015, 4.9, 1.44),
      SplineAreaData(2016, 4.5, 2),
      SplineAreaData(2017, 3.6, 1.56),
      SplineAreaData(2018, 3.43, 2.1),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
              child: CustomGraph(
                datas: firstChartData,
                borderColor: Colors.blue[200],
                gradientColor: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ["1H", "1D", "1W", "1M"]
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        selectedChart = e;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: selectedChart == e
                              ? Colors.white.withOpacity(0.1)
                              : null,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: selectedChart != e
                                ? Colors.white.withOpacity(0.4)
                                : null,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: CryptoCoin.datas
                  .map((coin) => CryptoTile(
                        coin: coin,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
