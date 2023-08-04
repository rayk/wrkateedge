part of '../value_elements.dart';

/// Represents a boolean value that intended for display.
@immutable
class BoolToggleValue implements ViewValue<bool> {
  @override
  final StringSelector label;

  @override
  final ValueSemantic semantic;

  @override
  final StringSelector tooltip;

  final ValueObject<bool> source;

  @override
  final IList<ViewCommand> commands;

  @override
  Option<K> getCommand<K extends ViewCommand>() => selectCommand<K>(commands);

  const BoolToggleValue({
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
    required this.commands,
  });

  @override
  Option<bool> get value => source.value;
}
