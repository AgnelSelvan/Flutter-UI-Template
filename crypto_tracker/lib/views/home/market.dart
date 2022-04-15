import 'package:crypto_tracker/views/home/crypto_coin.dart';
import 'package:crypto_tracker/widgets/crypto_tile.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  Widget getListTile(CryptoCoin coin) {
    return CryptoTile(
      coin: coin,
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    var future = Future(() {});
    for (var i = 0; i < CryptoCoin.datas.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _listItems.add(getListTile(CryptoCoin.datas[i]));
          _listKey.currentState?.insertItem(i);
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _listItems.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(
                Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.decelerate))),
            child: _listItems[index],
          );
        });
  }
}
