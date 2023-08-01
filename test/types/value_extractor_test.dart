import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wrkateedge/domain/entities/entities.dart';
import 'package:wrkateedge/domain/values/values.dart';
import 'package:wrkateedge/repository/types/types.dart';

class MockRepository {
  /// The repository's consumer would pass a [RepoRequest] to the repository
  /// the repository has no need to know about the concrete implementation of
  /// the [EntityView] the is hidden behind the [ValueExtractor].
  EntityView getEntity(RepoRequest request) {
    return request.extractor.run(Duck());
  }
}

class Duck implements DomainEntity {
  @override
  IList<ValueObject> get constituents => throw UnimplementedError();

  @override
  CreatedOn get createdOn => throw UnimplementedError();

  @override
  Revision get revision => throw UnimplementedError();

  @override
  UpdatedOn get updatedOn => throw UnimplementedError();

  @override
  UuidIdentifier get uuid => throw UnimplementedError();
}

class ConcreteEntityView implements EntityView {
  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  @override
  // TODO: implement ref
  String get ref => throw UnimplementedError();

  @override
  // TODO: implement revision
  int get revision => throw UnimplementedError();
}

main() {
  group('ValueSelector Type Verification:', () {
    test('Should identify a Reader as <ValueSelector>.', () {
      final sut = Reader<Duck, ConcreteEntityView>(
          (Duck entity) => ConcreteEntityView());
      expect(sut, isA<ValueExtractor>());
    });

    test('Should not have dependency on concrete types.', () {
      final sut = MockRepository();

      /// Request made by the consumer only using the concrete types they
      /// implement or those domain types exposed by the repository.
      final RepoRequest request = (
        params: {#id: 1},
        extractor: Reader<Duck, ConcreteEntityView>(
          (Duck entity) => ConcreteEntityView(),
        ),
      );

      final result = sut.getEntity(request);

      expect(result, isA<EntityView>());
    });
  });
}
