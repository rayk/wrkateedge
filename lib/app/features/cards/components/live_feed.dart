import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';

class LiveFeed extends StatelessWidget {
  const LiveFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Sparkline(
        averageLine: true,
        useCubicSmoothing: true,
        cubicSmoothingFactor: 0.2,
        fillMode: FillMode.below,
        pointsMode: PointsMode.all,
        data: List.generate(
            20, (index) => Faker().randomGenerator.decimal(scale: 2, min: 2)));
  }
}
