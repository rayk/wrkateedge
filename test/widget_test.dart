import 'package:flutter_test/flutter_test.dart';
import 'package:wrkateedge/app/app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WrkAteEdgeApp(
      appVersion: '0.0.1',
      showDebugBanner: false,
    ));

    await tester.pump();
  });
}
