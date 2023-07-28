part of 'values.dart';

/// Contains a numeric value that indicates the revision of an entity.
///
/// {@category ValueObject}
abstract class Weight extends Object
    with PropertyValue<double>
    implements ValueObject<double>, Built<Weight, WeightBuilder> {
  static Serializer<Weight> get serializer => _$weightSerializer;

  factory Weight([void Function(WeightBuilder) updates]) = _$Weight;

  factory Weight.value(double v) => Weight((b) => b..v = v);

  factory Weight.empty() => Weight((b) => b..v = null);

  factory Weight.fake() => Weight((b) => b..v = _weightFaker());

  Weight._();
}

double _weightFaker() => _faker.randomGenerator.decimal(scale: 1, min: 0);
