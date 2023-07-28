import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../values/values.dart';

part 'group.g.dart';
part 'range.dart';

@BuiltValue(instantiable: false)
abstract class ValueGroup {
  ValueGroup rebuild(void Function(ValueGroupBuilder) updates);

  ValueGroupBuilder toBuilder();
}
