import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/entities.dart';
import '../../store/store.dart';
import '../types/types.dart';

export 'package:wrkateedge/domain/entities/entities.dart' show CardEntity;

part 'card_repository.g.dart';

@riverpod
CardRepository cardRepository(CardRepositoryRef ref) =>
    CardRepository(ref.watch(dataStoreProvider()));

/// Repository that provides access to the [CardEntity] data.
class CardRepository extends Equatable {
  final FakeDataStore _dataStore;
  final IList<CardEntity> _cache;

  CardRepository(this._dataStore) : _cache = IList();

  /// Returns a [Task] that returns a [List] of [EntityView].
  Task<IList<T>> getAllCards<T>(RepoRequest request) => _dataStore.getAll().map(
        (result) => result.match(() => IList<T>(), (entities) {
          final cards = entities.map((e) => e as CardEntity);
          _cache.clear();
          _cache.addAll(cards);
          return IList<T>(cards.map((e) => request.extractor.run(e)));
        }),
      );

  /// Return all the domain card entities wrapped in [EntityView].
  /// which match the values in [request].
  Task<IList<T>> getCard<T>(RepoRequest request) {
    throw UnimplementedError();
  }

  Task<T> patchCard<T>(RepoRequest request) {
    final payload = request.params[#payload] as CardEntity;
    return _dataStore.put(payload).map((a) => a.match(
        () => throw StateError('Put into store failed'),
        (t) => request.extractor.run(payload)));
  }

  Task<IList<T>> putCard<T>(RepoRequest request) {
    throw UnimplementedError();
  }

  Task<IList<T>> deleteCard<T>(RepoRequest request) {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [_dataStore];
}
