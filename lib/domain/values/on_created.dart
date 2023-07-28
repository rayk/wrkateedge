part of 'values.dart';

/// Contains a date and time value that indicates when an entity was created.
///
/// {@category ValueObject}
abstract class CreatedOn extends Object
    with PropertyValue<DateTime>
    implements ValueObject<DateTime>, Built<CreatedOn, CreatedOnBuilder> {
  static Serializer<CreatedOn> get serializer => _$createdOnSerializer;

  factory CreatedOn([void Function(CreatedOnBuilder) updates]) = _$CreatedOn;

  factory CreatedOn.value(DateTime v) => CreatedOn((b) => b..v = v.toUtc());

  factory CreatedOn.empty() => CreatedOn((b) => b..v = null);

  factory CreatedOn.fake() => CreatedOn((b) => b..v = _createdOnFaker());

  CreatedOn._();
}

DateTime _createdOnFaker() => _faker.date.dateTime().toUtc();
