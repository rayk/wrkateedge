part of 'view_values.dart';

/// Wrapper for a simple text value, that is expected to have single line length.
@immutable
class TextValue implements ViewValue<String> {
  @override
  final ValueSemantic semantic;

  @override
  final StringSelector label;

  @override
  final StringSelector tooltip;

  final ValueObject<String> source;

  const TextValue({
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
  });

  @override
  Option<String> get value => source.value;
}
