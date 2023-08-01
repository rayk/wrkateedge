part of 'values.dart';

abstract class IsActiveFlag extends Object
    with PropertyValue<bool>
    implements ValueObject<bool>, Built<IsActiveFlag, IsActiveFlagBuilder> {
  static Serializer<IsActiveFlag> get serializer => _$isActiveFlagSerializer;

  factory IsActiveFlag([void Function(IsActiveFlagBuilder) updates]) =
      _$IsActiveFlag;

  factory IsActiveFlag.value(bool v) => IsActiveFlag((b) => b..v = v);

  factory IsActiveFlag.empty() => IsActiveFlag((b) => b..v = null);

  factory IsActiveFlag.fake() =>
      IsActiveFlag((b) => b..v = _isActiveFlagFaker());

  IsActiveFlag toggle() =>
      rebuild((b) => b..v = value.fold(() => null, (a) => !a));

  IsActiveFlag._();
}

bool _isActiveFlagFaker() => _faker.randomGenerator.boolean();
