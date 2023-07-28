part of 'values.dart';

/// Label contains a short common name for display in user interfaces.
///
/// {@category ValueObject}
abstract class Label extends Object
    with PropertyValue<String>
    implements ValueObject<String>, Built<Label, LabelBuilder> {
  static Serializer<Label> get serializer => _$labelSerializer;

  factory Label([void Function(LabelBuilder) updates]) = _$Label;

  factory Label.value(String v) => Label((b) => b..v = v);

  factory Label.empty() => Label((b) => b..v = null);

  factory Label.fake() => Label((b) => b..v = _labelFaker());

  Label._();
}

String _labelFaker() => _faker.randomGenerator.element<String>([
      _faker.conference.name(),
      _faker.lorem.word(),
      _faker.food.dish(),
    ]);
