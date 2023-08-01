import 'package:chart_sparkline/chart_sparkline.dart';
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
        data: [
          0.0,
          0.2,
          0.25,
          0.09,
          -0.5,
          -0.2,
          0.1,
          0.15,
          0.20,
          0.3,
          0.5,
          0.6,
          0.7,
          0.9,
          0.99,
        ]);
  }
}
