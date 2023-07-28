part of 'view_model.dart';

/// Holder of view that is intended to be rendered.
sealed class ViewValue<T> {
  /// The value that is to be rendered.
  Option<T> get value;

  /// The label of the value that is to be rendered.
  Option<String> get label;

  /// Text to be displayed as a tooltip.
  Option<String> get tooltip;
}

/// A currency value for rendering.
class CurrencyValue<double> implements ViewValue<double> {
  @override
  final Option<double> value;

  @override
  final Option<String> label;

  @override
  final Option<String> tooltip;

  CurrencyValue(this.value, this.label, this.tooltip);
}

/// A date value for rendering.
class DateValue<DateTime> implements ViewValue<DateTime> {
  @override
  final Option<DateTime> value;

  @override
  final Option<String> label;

  @override
  final Option<String> tooltip;

  DateValue(this.value, this.label, this.tooltip);
}
