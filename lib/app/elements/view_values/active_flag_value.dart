part of 'view_values.dart';

@immutable
class ActiveFlagValue implements ViewValue<bool> {
  @override
  final StringSelector label;

  @override
  final ValueSemantic semantic;

  @override
  final StringSelector tooltip;

  final ValueObject<bool> source;

  @override
  Option<bool> get value => source.value;

  const ActiveFlagValue({
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
  });
}
