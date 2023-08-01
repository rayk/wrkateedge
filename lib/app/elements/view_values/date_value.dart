part of 'view_values.dart';

/// Wrapper for a data value.
@immutable
class DateValue extends ViewValue<DateTime> {
  @override
  final ValueSemantic semantic;

  @override
  final StringSelector label;

  @override
  final StringSelector tooltip;

  final ValueObject<DateTime> source;

  DateValue({
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
  });

  @override
  Option<DateTime> get value => source.value.map((t) => t.toLocal());
}
