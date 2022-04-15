import 'dart:math';

import 'package:flutter/material.dart';

class ParticleGenerator {
  static Color getRandomColor(Random random) {
    final a = random.nextInt(255);
    final r = random.nextInt(255);
    final g = random.nextInt(255);
    final b = random.nextInt(255);
    return Color.fromARGB(a, r, g, b);
  }

  static polarToCartesian(double speed, double theta) {
    return Offset(speed * cos(theta), speed * sin(theta));
  }
}
