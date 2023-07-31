part of 'view_values.dart';

/// Wrapper for a data value.
class DateValue extends ViewValue<DateTime> {
  @override
  final Option<DateTime> value;

  DateValue(
    this.value,
  );

  @override
  StringSelector label(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  ValueSemantic get semantic => throw UnimplementedError();

  @override
  StringSelector tooltip(BuildContext context) {
    throw UnimplementedError();
  }
}
