part of '../value_elements.dart';

@immutable
class IntegerValue implements ViewValue<int> {
  @override
  final IList<ViewCommand> commands;

  @override
  final StringSelector label;

  @override
  final ValueSemantic semantic;

  @override
  final StringSelector tooltip;

  final ValueObject<int> source;

  @override
  Option<int> get value => source.value;

  @override
  Option<K> getCommand<K extends ViewCommand>() => selectCommand<K>(commands);

  const IntegerValue({
    required this.commands,
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
  });
}
