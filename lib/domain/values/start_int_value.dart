part of 'values.dart';

abstract class StartIntValue extends Object
    with PropertyValue<int>
    implements ValueObject<int>, Built<StartIntValue, StartIntValueBuilder> {
  static Serializer<StartIntValue> get serializer => _$startIntValueSerializer;

  factory StartIntValue([void Function(StartIntValueBuilder) updates]) =
      _$StartIntValue;

  factory StartIntValue.value(int v) => StartIntValue((b) => b..v = v);

  factory StartIntValue.empty() => StartIntValue((b) => b..v = null);

  factory StartIntValue.fake() =>
      StartIntValue((b) => b..v = _startIntValueFaker());

  StartIntValue._();
}

int _startIntValueFaker() => _faker.randomGenerator.integer(100, min: 1);
