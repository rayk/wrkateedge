import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:uuid/uuid.dart';
import 'package:wrkateedge/domain/group/group.dart';

import '../values/values.dart';

part 'card.dart';
part 'entities.g.dart';

mixin DomainEntity<T> {
  /// Returns the unique namespaced identifier for an entity.
  UuidIdentifier get uuid;

  /// Returns the Date and Time this entity was created within the domain.
  CreatedOn get createdOn;

  /// Returns the Date and Time this entity was last updated.
  UpdatedOn get updatedOn;

  /// Returns the revision number of this entity. 1 being original.
  Revision get revision;

  /// Returns the all the value groups contained in this entity.
  IList<ValueObject<dynamic>> get constituents =>
      IList<ValueObject<dynamic>>(const []);
}
