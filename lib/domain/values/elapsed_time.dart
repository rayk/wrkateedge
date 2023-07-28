part of 'values.dart';

abstract class ElapsedTime extends Object
    with PropertyValue<Duration>
    implements ValueObject<Duration>, Built<ElapsedTime, ElapsedTimeBuilder> {
  static Serializer<ElapsedTime> get serializer => _$elapsedTimeSerializer;

  factory ElapsedTime([void Function(ElapsedTimeBuilder) updates]) =
      _$ElapsedTime;

  factory ElapsedTime.value(Duration v) => ElapsedTime((b) => b..v = v);

  factory ElapsedTime.empty() => ElapsedTime((b) => b..v = null);

  factory ElapsedTime.fake() => ElapsedTime((b) => b..v = _elapsedTimeFaker());

  ElapsedTime._();
}

Duration _elapsedTimeFaker() =>
    Duration(microseconds: _faker.randomGenerator.integer(999999, min: 1));
