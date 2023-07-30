import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrkateedge/repository/repository.dart';

import '../../store/store.dart';

part 'card_repository.g.dart';

@riverpod
CardRepository cardRepository(CardRepositoryRef ref) =>
    CardRepository(ref.watch(dataStoreProvider([])));

/// Repository that provides access to the [CardEntity] data.
class CardRepository extends Equatable {
  final FakeDataStore _dataStore;

  const CardRepository(this._dataStore);

  /// Returns a [Task] that returns a [List] of [EntityView].
  Task<IList<EntityView>> getAllCards(RepoRequest request) {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [_dataStore];
}
