part of 'view_values.dart';

@immutable
class DefaultFlagValue implements ViewValue<bool> {
  @override
  final ValueSemantic semantic;

  @override
  final StringSelector label;

  @override
  final StringSelector tooltip;

  final ValueObject<bool> source;

  toggle() => source.rebuild((b) => b..v = value.fold(() => null, (a) => !a));

  const DefaultFlagValue({
    required this.semantic,
    required this.label,
    required this.tooltip,
    required this.source,
  });

  @override
  Option<bool> get value => source.value;
}
