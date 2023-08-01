part of 'view_values.dart';

@immutable
class ParagraphValue implements ViewValue<String> {
  @override
  final ValueSemantic semantic;

  @override
  final StringSelector label;

  @override
  final StringSelector tooltip;

  final ValueObject<String> source;

  const ParagraphValue({
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
  });

  @override
  Option<String> get value => source.value;
}
