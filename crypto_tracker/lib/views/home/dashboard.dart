import 'dart:math';

import 'package:crypto_tracker/core/res/color.dart';
import 'package:crypto_tracker/core/res/particles.dart';
import 'package:crypto_tracker/models/particle.dart';
import 'package:crypto_tracker/models/spline_area.dart';
import 'package:crypto_tracker/widgets/credit_painter.dart';
import 'package:crypto_tracker/widgets/crypto_card.dart';
import 'package:crypto_tracker/widgets/custom_graph.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  List<Particle> _particlesList = [];
  final Random _random = Random(DateTime.now().millisecondsSinceEpoch);
  final maxSpeed = 2;
  final maxTheta = 2 * pi;
  final maxRadius = 10;
  late AnimationController _particleAnimationController;
  late Animation<double> _particleAnimation;
  List<SplineAreaData>? firstChartData, secondChartData;

  @override
  initState() {
    super.initState();
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
    secondChartData = <SplineAreaData>[
      SplineAreaData(2010, 4.53, 3.3),
      SplineAreaData(2011, 8.5, 5.4),
      SplineAreaData(2012, 2, 2.65),
      SplineAreaData(2013, 9.4, 2.62),
      SplineAreaData(2014, 5.8, 1.99),
      SplineAreaData(2015, 4.9, 1.44),
      SplineAreaData(2016, 4.5, 2),
      SplineAreaData(2017, 9.6, 1.56),
      SplineAreaData(2018, 12.43, 2.1),
    ];

    _particleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _particleAnimation =
        Tween<double>(begin: 0, end: 300).animate(_particleAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _particleAnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              _particleAnimationController.forward();
            }
          });
    _particleAnimationController.forward();

    _particlesList = List.generate(5, (index) {
      final color = ParticleGenerator.getRandomColor(_random);
      return Particle(
        position: const Offset(-1, -1),
        color: color,
        speed: _random.nextDouble() * maxSpeed,
        theta: _random.nextDouble() * maxTheta,
        radius: _random.nextDouble() * maxRadius,
      );
    }).toList();
  }

  @override
  void dispose() {
    _particleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            const CryptoCard(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icons.send,
                Icons.download,
                Icons.qr_code_scanner_sharp,
                Icons.settings,
              ]
                  .map((e) => Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          e,
                          color: Colors.white.withOpacity(0.8),
                          size: 20,
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 100.w,
              height: 180,
              decoration: BoxDecoration(
                gradient: AppColors.getDarkLinearGradient(Colors.blue),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomPaint(
                painter: CreditCardPainter(
                  _particleAnimation.value,
                  particlesList: _particlesList,
                  random: _random,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Add Credit / Debit Card",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.6,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "VISA / Mastercard",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 43.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ZRX/USDT",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          Text(
                            "-2.25%",
                            style: TextStyle(color: Colors.red[400]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 43.w,
                        child: _buildSplineAreaChart(
                          firstChartData,
                          borderColor: Colors.red[200],
                          gradientColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 43.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "BNB/USDT",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          Text(
                            "+40.25%",
                            style: TextStyle(color: Colors.green[400]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 43.w,
                        child: _buildSplineAreaChart(
                          secondChartData,
                          borderColor: Colors.green[200],
                          gradientColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CustomGraph _buildSplineAreaChart(
    List<SplineAreaData>? datas, {
    Color? borderColor,
    MaterialColor? gradientColor,
  }) {
    return CustomGraph(
      datas: datas,
      borderColor: borderColor,
      gradientColor: gradientColor,
    );
  }
}
