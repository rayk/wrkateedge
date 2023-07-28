part of 'view_model.dart';

/// Holder of a collections of view values for rendering. Where the <T> is
/// is the domain object type.
sealed class ViewObject<T> {
  /// Reference to the domain object what was the primary source of this view object.
  String get ref;

  /// The collection of view values.
  List<ViewValue> get values;
}
