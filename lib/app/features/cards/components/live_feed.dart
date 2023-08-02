import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class LiveFeed extends StatelessWidget {
  final bool isEnabled;

  const LiveFeed({super.key, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Sparkline(
      lineColor: isEnabled
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.inversePrimary.withOpacity(0.6),
      pointColor: isEnabled
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.inversePrimary,
      fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.0),
      averageLine: isEnabled,
      useCubicSmoothing: true,
      cubicSmoothingFactor: 0.2,
      fillMode: FillMode.below,
      pointsMode: isEnabled ? PointsMode.all : PointsMode.none,
      data: List.generate(
        20,
        (index) => Faker().randomGenerator.decimal(scale: 2, min: 2),
      ),
    );
  }
}
