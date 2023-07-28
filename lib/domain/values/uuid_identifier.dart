part of 'values.dart';

/// Contains a universally unique identifier (UUID).
/// {@category Value Objects}
abstract class UuidIdentifier extends Object
    with PropertyValue<String>
    implements
        ValueObject<String>,
        Built<UuidIdentifier, UuidIdentifierBuilder> {
  static Serializer<UuidIdentifier> get serializer =>
      _$uuidIdentifierSerializer;

  factory UuidIdentifier([void Function(UuidIdentifierBuilder) updates]) =
      _$UuidIdentifier;

  factory UuidIdentifier.value(String v) => UuidIdentifier((b) => b..v = v);

  factory UuidIdentifier.empty() => UuidIdentifier((b) => b..v = null);

  factory UuidIdentifier.fake() =>
      UuidIdentifier((b) => b..v = _valueFakerGuidGuid());

  UuidIdentifier._();
}

String _valueFakerGuidGuid() => _faker.guid.guid();
