part of 'values.dart';

/// Contains a date and time value that indicates when an entity was last updated.
///
/// {@category ValueObject}
abstract class UpdatedOn extends Object
    with PropertyValue<DateTime>
    implements ValueObject<DateTime>, Built<UpdatedOn, UpdatedOnBuilder> {
  static Serializer<UpdatedOn> get serializer => _$updatedOnSerializer;

  factory UpdatedOn([void Function(UpdatedOnBuilder) updates]) = _$UpdatedOn;

  factory UpdatedOn.value(DateTime v) => UpdatedOn((b) => b..v = v.toUtc());

  factory UpdatedOn.empty() => UpdatedOn((b) => b..v = null);

  factory UpdatedOn.fake() => UpdatedOn((b) => b..v = _updatedOnFaker());

  UpdatedOn._();
}

DateTime _updatedOnFaker() => _faker.date.dateTime().toUtc();
