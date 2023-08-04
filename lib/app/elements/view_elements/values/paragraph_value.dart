part of '../value_elements.dart';

@immutable
class ParagraphValue implements ViewValue<String> {
  @override
  final IList<ViewCommand> commands;

  @override
  final StringSelector label;

  @override
  final ValueSemantic semantic;

  final ValueObject<String> source;

  @override
  final StringSelector tooltip;

  @override
  Option<String> get value => source.value;

  @override
  Option<K> getCommand<K extends ViewCommand>() => selectCommand<K>(commands);

  const ParagraphValue({
    required this.commands,
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
  });
}
