import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wrkateedge/app/features/cards/state/view_model/card_entity_view.dart';
import 'package:wrkateedge/domain/entities/entities.dart';
import 'package:wrkateedge/repository/card_repository/card_repository.dart';
import 'package:wrkateedge/repository/repository.dart';
import 'package:wrkateedge/store/store.dart';

void main() {
  group('CardRepository:', () {
    late CardRepository repo;

    setUp(() async {
      repo = CardRepository(
        FakeDataStore(
          List.generate(50, (index) => CardEntity.fake()),
        ),
      );
    });

    tearDown(() {});

    test('Should return a card repository.', () {
      expect(repo, isA<CardRepository>());
    });

    test('Should return a list of cards.', () async {
      final RepoRequest request = (
        params: {},
        extractor: Reader<CardEntity, CardEntityView>((entity) {
          return CardEntityView();
        }),
      );
    });
  });
}
