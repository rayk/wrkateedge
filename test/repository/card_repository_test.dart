import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wrkateedge/app/features/cards/state/view_model/card_entity_view.dart';
import 'package:wrkateedge/repository/card_repository/card_repository.dart';
import 'package:wrkateedge/repository/repository.dart';
import 'package:wrkateedge/store/store.dart';

Function throwMissingKeyField = () => throw ArgumentError('');

void main() {
  group('CardRepository:', () {
    late CardRepository repo;
    const fakeCardCount = 50;

    setUp(() async {
      repo = CardRepository(
        FakeDataStore(
          List.generate(fakeCardCount, (index) => CardEntity.fake()),
        ),
      );
    });

    tearDown(() {});

    test('Should return a card repository.', () {
      expect(repo, isA<CardRepository>());
    });

    test('Should return a list of all the cards in the repo.', () async {
      final RepoRequest request = (
        params: {},
        extractor: Reader<CardEntity, CardEntityView>(
          (entity) => CardEntityView(
              ref: entity.uuid.value.getOrElse(throwMissingKeyField()),
              revision: entity.revision.value.getOrElse(throwMissingKeyField()),
              entity: entity),
        )
      );

      repo.getAllCards(request).run().then((values) {
        expect(values.length, fakeCardCount);
        expect(
            values.every(
              (entity) => entity.ref.isNotEmpty && entity.revision > 0,
            ),
            isTrue);
      });
    });
  });
}
