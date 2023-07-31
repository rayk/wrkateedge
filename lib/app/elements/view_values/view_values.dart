/// Contains a number wrappers for domain values.
library view_values;

import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';

part 'date_value.dart';
part 'text_value.dart';

/// Signature of a function that return T when context is passed in.
typedef StringSelector = String Function(BuildContext context);

/// Enumeration of the meaning of a value.
enum ValueSemantic { label, description, useCount }

/// Base wrapper that is implemented by all view values.
sealed class ViewValue<T> {
  /// Return the enumerated meaning of this value.
  ValueSemantic get semantic;

  /// The value that is to be rendered.
  Option<T> get value;

  /// Returns the localised label text for this value, where no label exist
  /// and empty string is returned.
  StringSelector label(BuildContext context);

  /// Returns the localised tooltip text for this value, where not tooltip exist
  /// and empty string is returned.
  StringSelector tooltip(BuildContext context);
}
