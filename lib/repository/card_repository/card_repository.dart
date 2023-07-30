import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrkateedge/domain/domain.dart';
import 'package:wrkateedge/store/store.dart';

part 'card_repository.g.dart';

@riverpod
CardRepository cardRepository(CardRepositoryRef ref) =>
    CardRepository(ref.watch(dataStoreProvider([])));

/// Repository that provides access to the [CardEntity] data.
class CardRepository extends Equatable {
  final FakeDataStore _dataStore;

  const CardRepository(this._dataStore);

  @override
  List<Object?> get props => [_dataStore];
}
