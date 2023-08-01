part of 'values.dart';

///  Contains a boolean value that indicates whether a value is the default.
///
/// {@category ValueObject}
abstract class IsDefaultFlag extends Object
    with PropertyValue<bool>
    implements ValueObject<bool>, Built<IsDefaultFlag, IsDefaultFlagBuilder> {
  static Serializer<IsDefaultFlag> get serializer => _$isDefaultFlagSerializer;

  factory IsDefaultFlag([void Function(IsDefaultFlagBuilder) updates]) =
      _$IsDefaultFlag;

  factory IsDefaultFlag.value(bool v) => IsDefaultFlag((b) => b..v = v);

  factory IsDefaultFlag.empty() => IsDefaultFlag((b) => b..v = null);

  factory IsDefaultFlag.fake() =>
      IsDefaultFlag((b) => b..v = _isDefaultFlagFaker());

  toggle() => rebuild((b) => b..v = value.fold(() => null, (a) => !a));

  IsDefaultFlag._();
}

bool _isDefaultFlagFaker() => _faker.randomGenerator.boolean();
