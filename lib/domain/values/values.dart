import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:faker/faker.dart';
import 'package:fpdart/fpdart.dart';

part 'description.dart';
part 'elapsed_time.dart';
part 'end_int_value.dart';
part 'is_active_flag.dart';
part 'is_default_flag.dart';
part 'label.dart';
part 'on_created.dart';
part 'on_updated.dart';
part 'rev.dart';
part 'start_int_value.dart';
part 'uuid_identifier.dart';
part 'values.g.dart';
part 'weight.dart';

final _faker = Faker();

/// ValueObject is a base class for all value objects.
@BuiltValue(instantiable: false)
abstract class ValueObject<T> extends Object with PropertyValue<T> {
  @override
  T? get v;

  @override
  Type get type => T;

  @override
  Option<T> get value => optionOf(v);

  ValueObject rebuild(void Function(ValueObjectBuilder<T>) updates);

  ValueObjectBuilder<T> toBuilder();
}

mixin PropertyValue<T> {
  T? get v;

  Type get type => T;

  Option<T> get value => optionOf(v);
}
