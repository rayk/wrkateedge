import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrkateedge/repository/types/types.dart';

import '../../store/store.dart';

export 'package:wrkateedge/domain/entities/entities.dart' show CardEntity;

part 'card_repository.g.dart';

@riverpod
CardRepository cardRepository(CardRepositoryRef ref) =>
    CardRepository(ref.watch(dataStoreProvider([])));

/// Repository that provides access to the [CardEntity] data.
class CardRepository extends Equatable {
  final FakeDataStore _dataStore;

  const CardRepository(this._dataStore);

  /// Returns a [Task] that returns a [List] of [EntityView].
  Task<IList<EntityView>> getAllCards(RepoRequest request) =>
      _dataStore.getAll().map(
            (result) => result.match(
              () => IList<EntityView>(),
              (entities) => IList(
                entities.map((e) => request.extractor.run(e)),
              ),
            ),
          );

  /// Return all the domain card entities wrapped in [EntityView].
  /// which match the values in [request].
  Task<IList<EntityView>> getCard(RepoRequest request) {
    throw UnimplementedError();
  }

  Task<IList<EntityView>> putCard(RepoRequest request) {
    throw UnimplementedError();
  }

  Task<IList<EntityView>> deleteCard(RepoRequest request) {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
