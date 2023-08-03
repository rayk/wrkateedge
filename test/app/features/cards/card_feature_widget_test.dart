@Tags(['widget'])
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrkateedge/app/features/cards/cards.dart';

void main() {
  testWidgets('Should display Card Feature.', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CardFeature(),
      ),
    );

    final cardFeatureFinder = find.byType(CardFeature);

    expect(
      cardFeatureFinder,
      findsOneWidget,
      reason: 'Could not located Card Feature widget.',
    );
  });
}
