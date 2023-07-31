/// Fake data store to support the reference implementation.
library store;

import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrkateedge/domain/domain.dart';

part 'store.g.dart';

final _rnd = Random();

/// Returns a random duration that represents the time associated with
/// async store operations.
Duration randomDelay() => Duration(
      milliseconds: 300 + _rnd.nextInt(1200 - 300),
    );

@riverpod
FakeDataStore dataStore(
  DataStoreRef ref,
  List<DomainEntity> source,
) =>
    FakeDataStore([]);

/// Represents a data store which handled the durability operations of
/// domain objects.
class FakeDataStore {
  final Set<DomainEntity> _entities;

  FakeDataStore(List<DomainEntity> payload)
      : _entities = <DomainEntity>{}..addAll(payload);

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
  Task<Option<List<DomainEntity>>> getAll() {
    return Task(() => Future.delayed(
          randomDelay(),
          () => some(_entities.toList()),
        ));
  }

  /// Returns a unit if the entity was added.
  Future<Option<Unit>> put(DomainEntity entity) async => Future.delayed(
        randomDelay(),
        () => _entities.add(entity).match<Option<Unit>>(
              () => none<Unit>(),
              () => some(unit),
            ),
      );

  /// Loads the entities into the store.
  Future<Option<Unit>> load(List<DomainEntity> payload) async =>
      Future.delayed(randomDelay(), () {
        _entities.addAll(payload);
        return some(unit);
      });

  bool dispose() {
    _entities.clear();
    return true;
  }
}
