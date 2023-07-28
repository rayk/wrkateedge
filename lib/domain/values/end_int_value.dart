part of 'values.dart';

abstract class EndIntValue extends Object
    with PropertyValue<int>
    implements Built<EndIntValue, EndIntValueBuilder> {
  static Serializer<EndIntValue> get serializer => _$endIntValueSerializer;

  factory EndIntValue([void Function(EndIntValueBuilder) updates]) =
      _$EndIntValue;

  factory EndIntValue.value(int v) => EndIntValue((b) => b..v = v);

  factory EndIntValue.empty() => EndIntValue((b) => b..v = null);

  factory EndIntValue.fake() => EndIntValue((b) => b..v = _endIntValueFaker());

  EndIntValue._();
}

int _endIntValueFaker() => _faker.randomGenerator.integer(999, min: 101);
