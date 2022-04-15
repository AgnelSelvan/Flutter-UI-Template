import 'package:crypto_tracker/views/coin.dart';
import 'package:crypto_tracker/views/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static const home = "/home";
  static const coinDetails = "/coin/details";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case Routes.coinDetails:
        return MaterialPageRoute(
          builder: ((context) => const CoinScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}
