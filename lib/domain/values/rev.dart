part of 'values.dart';

/// Contains a numeric value that indicates the revision of an entity.
///
/// {@category ValueObject}
abstract class Revision extends Object
    with PropertyValue<int>
    implements ValueObject<int>, Built<Revision, RevisionBuilder> {
  static Serializer<Revision> get serializer => _$revisionSerializer;

  factory Revision([void Function(RevisionBuilder) updates]) = _$Revision;

  factory Revision.value(int v) => Revision((b) => b..v = v);

  factory Revision.empty() => Revision((b) => b..v = null);

  factory Revision.fake() => Revision((b) => b..v = _revisionFaker());

  Revision._();
}

int _revisionFaker() => _faker.randomGenerator.integer(9999, min: 0);
