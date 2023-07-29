import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:wrkateedge/domain/domain.dart';

part 'serializer.g.dart';

@SerializersFor([
  CardEntity,
  Label,
  Description,
  ElapsedTime,
  EndIntValue,
  IsDefaultFlag,
  CreatedOn,
  UpdatedOn,
  Revision,
  StartIntValue,
  UuidIdentifier,
  Weight,
])

/// Returns a serializer.
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
