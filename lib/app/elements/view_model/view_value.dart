part of 'view_model.dart';

/// A currency value for rendering.
class CurrencyValue implements ViewValue<double> {
  @override
  final Option<double> value;

  CurrencyValue(
    this.value,
  );

  @override
  String label(BuildContext context) {
    // TODO: implement label
    throw UnimplementedError();
  }

  @override
  String tooltip(BuildContext context) {
    // TODO: implement tooltip
    throw UnimplementedError();
  }
}

/// A date value for rendering.
class DateValue implements ViewValue<DateValue> {
  @override
  final Option<DateTime> value;

  DateValue(
    this.value,
  );

  @override
  String label(BuildContext context) {
    // TODO: implement label
    throw UnimplementedError();
  }

  @override
  String tooltip(BuildContext context) {
    // TODO: implement tooltip
    throw UnimplementedError();
  }
}

/// A date time value for rendering.
class TextValue implements ViewValue<String> {
  @override
  final Option<String> value;

  TextValue(
    this.value,
  );

  @override
  String label(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  String tooltip(BuildContext context) {
    // TODO: implement tooltip
    throw UnimplementedError();
  }
}

/// Holder of view that is intended to be rendered.
sealed class ViewValue<T> {
  /// The value that is to be rendered.
  Option<T> get value;

  /// Returns the label text.
  String label(BuildContext context);

  /// Returns the tooltip text.
  String tooltip(BuildContext context);
}
