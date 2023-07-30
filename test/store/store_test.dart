import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wrkateedge/domain/entities/entities.dart';
import 'package:wrkateedge/store/store.dart';

void main() {
  group('Smoke Fake Store', () {
    final source = List.generate(50, (index) => CardEntity.fake());
    final FakeDataStore store = FakeDataStore([]);

    setUp(() async {
      await store.load(source);
    });

    tearDown(() => store.dispose());

    test(
      'Should return option of all the items in the store.',
      () async {
        final allItems = await store.getAll();
        expect(allItems.isSome(), true);
        expect(allItems.getOrElse(() => fail('No Items in store')).length,
            equals(source.length));
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );

    test(
      'Should return option Some of the item in the store.',
      () async {
        final item = await store.get(source[0]
            .uuid
            .value
            .getOrElse(() => fail('CardEntry has no uuid.')));

        expect(item.isSome(), true);
        expect(item.getOrElse(() => fail('No Item in store')).uuid.v,
            equals(source[0].uuid.v));
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );

    test(
      'Should return option None of an item not in the store.',
      () async {
        final item = await store.get('not in store uid');
        expect(item.isNone(), true);
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );
  });
}
