part of 'view_values.dart';

@immutable
class IntegerValue implements ViewValue<int> {
  @override
  final ValueSemantic semantic;

  @override
  final StringSelector label;

  @override
  final StringSelector tooltip;

  final ValueObject<int> source;

  const IntegerValue({
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
  });

  @override
  Option<int> get value => source.value;
}
