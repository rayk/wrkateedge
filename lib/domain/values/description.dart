part of 'values.dart';

/// Contents a general explanation.
///
/// {@category ValueObject}
abstract class Description extends Object
    with PropertyValue<String>
    implements ValueObject<String>, Built<Description, DescriptionBuilder> {
  static Serializer<Description> get serializer => _$descriptionSerializer;

  factory Description([void Function(DescriptionBuilder) updates]) =
      _$Description;

  factory Description.value(String v) => Description((b) => b..v = v);

  factory Description.empty() => Description((b) => b..v = null);

  factory Description.fake() => Description((b) => b..v = _descriptionFaker());

  Description._();
}

String _descriptionFaker() => _faker.randomGenerator.element<String>([
      _faker.conference.name(),
      _faker.lorem.word(),
      _faker.food.dish(),
    ]);
