@Tags(['unit'])
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:loggy/loggy.dart';
import 'package:wrkateedge/config/config.dart';
import 'package:wrkateedge/domain/entities/entities.dart';
import 'package:wrkateedge/store/store.dart';

void main() {
  Loggy.initLoggy(
    logOptions: const LogOptions(LogLevel('test', ConfigValues.logLevel)),
  );
  final source = List.generate(50, (index) => CardEntity.fake());
  group('Smoke Fake Store', () {
    late FakeDataStore store;

    setUp(() {
      store = FakeDataStore(source);
      assert(store.entityCount == source.length,
          'Store should have ${source.length} items in it.');
    });

    test(
      'Should return option of all the items in the store.',
      () async {
        await store
            .getAll()
            .map(
              (result) => result.match(
                () => fail('No Items in store'),
                (items) => expect(items.length, equals(source.length)),
              ),
            )
            .run();
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );

    test(
      'Should return option Some of the item in the store.',
      () async {
        final String targetId =
            source[0].uuid.value.getOrElse(() => fail('No uuid'));
        assert(store.getById(targetId).uuid.v == targetId,
            'Id: $targetId should be in store.');

        final item = await store.get(source[0]
            .uuid
            .value
            .getOrElse(() => fail('CardEntry has no uuid.')));

        expect(item.isSome(), true,
            reason:
                'Card Uuid: ${source[0].uuid.value.getOrElse(() => 'Does not have uuid')} not in store!');
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
