import 'package:crypto_tracker/core/res/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
      value: 0,
      lowerBound: 0,
      upperBound: 1,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    super.initState();
  }

  late AnimationController _bellController;
  late List<Widget> _screensList;
  late List<IconData> _bottomIcons;
  int _selectedBottomIndex = 0;
  void _runAnimation() async {
    for (int i = 0; i < 5; i++) {
      await _bellController.forward();
      await _bellController.reverse();
    }
  }
//     _screensList = [
//       const DashboardScreen(),
//       const PortfolioScreen(),
//       const MarketScreen(),
//     ];
//     _bottomIcons = [
//       Icons.home,
//       Icons.account_balance_wallet,
//       Icons.maps_home_work_outlined,
//     ];

//     _bellController = AnimationController(
//       duration: const Duration(milliseconds: 1000),
//       vsync: this,
//     );
//     _runAnimation();

  @override
  void dispose() {
    _controller.dispose();
    _bellController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedBottomIndex == 1
          ? null
          : AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                child: InkWell(
                  onTap: () {
                    if (_controller.isAnimating) {
                      _controller.stop();
                      return;
                    }
                    _controller.repeat();
                  },
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.currency_bitcoin_sharp,
                        color: AppColors.bgColor,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.search),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 15.0, top: 10, bottom: 10),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      RotationTransition(
                          turns: Tween(begin: 0.0, end: -.1)
                              .chain(CurveTween(curve: Curves.elasticIn))
                              .animate(_bellController),
                          child: const Icon(Icons.notifications)),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
      body: _screensList[_selectedBottomIndex],
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight + 20,
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.3),
        ),
        child: ListView.builder(
          itemCount: _bottomIcons.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _selectedBottomIndex = index;
                setState(() {});
              },
              child: SizedBox(
                width: 100.w / _bottomIcons.length,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: _selectedBottomIndex == index
                            ? AppColors.getLinearGradient(Colors.indigo)
                            : null,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _bottomIcons[index],
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PositionedCircle extends StatelessWidget {
  final double? top, bottom, left, right;
  final double size;
  const PositionedCircle({
    Key? key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      bottom: bottom,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 40,
            )
          ],
          color: const Color(0xFf6d9bdd).withOpacity(0.05),
          //     shape: BoxShape.circle,
        ),
      ),
    );
  }
}
