/// Fake data store to support the reference implementation.
library store;

import 'dart:math';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:loggy/loggy.dart';
import 'package:meta/meta.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrkateedge/config/config.dart';
import 'package:wrkateedge/domain/domain.dart';

part 'store.g.dart';

final _rnd = Random();

/// Returns a random duration that represents the time associated with
/// async store operations.
Duration randomDelay() => Duration(
      milliseconds: ConfigValues.fakeMinAsyncDelay +
          _rnd.nextInt(
            ConfigValues.fakeMaxAsyncDelay - ConfigValues.fakeMinAsyncDelay,
          ),
    );

@riverpod
FakeDataStore dataStore(DataStoreRef ref, {List<CardEntity>? initialData}) =>
    FakeDataStore(
      initialData ?? List.generate(50, (index) => CardEntity.fake()),
    );

/// Represents a data store which handled the durability operations of
/// domain objects.
class FakeDataStore with UiLoggy {
  final ISet<DomainEntity> _entities;

  FakeDataStore(List<DomainEntity> payload)
      : _entities = ISet<DomainEntity>(payload) {
    loggy.debug('FakeDataStore: loaded with ${_entities.length} entities');
  }

  @visibleForTesting
  int get entityCount => _entities.length;

  @visibleForTesting
  DomainEntity getById(String uuid) =>
      _entities.firstWhere((e) => e.uuid.v == uuid);

  /// Returns a Some if the entity was removed, else a none.
  Future<Option<Unit>> delete(String uuid) async => Future.delayed(
        randomDelay(),
        () => Option.tryCatch(
          () => _entities.firstWhere((e) => e.uuid.v == uuid),
        ).match(
          () => none(),
          (t) => some(unit),
        ),
      );

  /// Returns an Option with any matching entity, else a none.
  Future<Option<DomainEntity>> get(String uuid) async => Future.delayed(
        randomDelay(),
        () => Option.tryCatch(
          () => _entities.firstWhere((e) => e.uuid.v == uuid),
        ),
      );

  /// Returns a list of all entitles in the this store.
  Task<Option<List<DomainEntity>>> getAll() => Task(() => Future.delayed(
        randomDelay(),
        () => some(_entities.toList()),
      ));

  /// Returns a unit if the entity was added.
  Task<Option<Unit>> put(DomainEntity entity) => Task(() => Future.delayed(
        randomDelay(),
        () => _entities.add(entity).isNotEmpty ? some(unit) : none(),
      ));

  /// Loads the entities into the store.
  Future<Option<Unit>> load(List<DomainEntity> payload) async =>
      Future.delayed(const Duration(milliseconds: 1), () {
        _entities.addAll(payload);
        return some(unit);
      });

  bool dispose() {
    _entities.clear();
    return true;
  }
}
