import 'dart:math';

import 'package:crypto_tracker/core/res/particles.dart';
import 'package:crypto_tracker/models/particle.dart';
import 'package:flutter/material.dart';

class CreditCardPainter extends CustomPainter {
  List<Particle> particlesList;
  final Random random;
  CreditCardPainter(double animationVal,
      {required this.particlesList, required this.random});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particlesList) {
      final velocity =
          ParticleGenerator.polarToCartesian(particle.speed, particle.theta);

      double dx = particle.position.dx + velocity.dx;
      double dy = particle.position.dy + velocity.dy;
      if (particle.position.dx < 10 || particle.position.dx > size.width - 10) {
        dx = random.nextDouble() * size.width;
      }
      if (particle.position.dy < 10 ||
          particle.position.dy > size.height - 10) {
        dy = random.nextDouble() * size.height;
      }
      particle.position = Offset(dx, dy);
    }
//     var c = Offset(dx, dy);
//     const double radius = 20;
    for (var item in particlesList) {
      var paint = Paint()..color = Colors.white.withOpacity(0.2);

      canvas.drawCircle(item.position, item.radius, paint);
    }
  }

  @override
  bool shouldRepaint(CreditCardPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CreditCardPainter oldDelegate) => false;
}
