part of 'group.dart';

abstract class IntRange
    implements ValueGroup, Built<IntRange, IntRangeBuilder> {
  static Serializer<IntRange> get serializer => _$intRangeSerializer;

  factory IntRange([void Function(IntRangeBuilder) updates]) = _$IntRange;

  factory IntRange.value(StartIntValue min, EndIntValue max) =>
      IntRange((b) => b
        ..min.replace(min)
        ..max.replace(max));

  factory IntRange.empty() => IntRange((b) => b
    ..min.replace(StartIntValue.empty())
    ..max.replace(EndIntValue.empty()));

  factory IntRange.fake() => IntRange((b) => b
    ..min.replace(StartIntValue.fake())
    ..max.replace(EndIntValue.fake()));

  IntRange._();

  /// The minimum value of the range.
  StartIntValue get min;

  /// The maximum value of the range.
  EndIntValue get max;
}
