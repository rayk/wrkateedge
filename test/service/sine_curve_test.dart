import 'package:flutter_test/flutter_test.dart';
import 'package:wrkateedge/service/live_feed/sine_curve.dart';

void main() {
  group('Sin Curve Calculation', () {
    test('Should return a value.', () {
      const sc = SineCurve(count: 10);
      final values = List.generate(50, (index) => sc.transform(index / 100));

      expect(values.every((element) => element >= 0 && element <= 1), true);
    });
  });
}
