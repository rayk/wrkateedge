part of 'view_values.dart';

/// Wrapper for a simple text value, that is expected to have single line length.
@immutable
class TextValue implements ViewValue<String> {
  @override
  final ValueSemantic semantic;

  const TextValue({
    required this.semantic,
  });

  @override
  StringSelector label(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  StringSelector tooltip(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Option<String> get value => throw UnimplementedError();
}
