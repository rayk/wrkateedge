/// Contains a number wrappers for domain values.
library view_values;

import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';

import '../../../domain/values/values.dart';
import '../../../repository/localizations/l10n.dart';

part 'date_value.dart';
part 'default_flag_value.dart';
part 'defaults_by_extension.dart';
part 'integer_value.dart';
part 'paragraph_value.dart';
part 'revision_value.dart';
part 'text_value.dart';

/// Signature of a function that return T when context is passed in.
typedef StringSelector = String Function(BuildContext context);

/// Enumeration of the meaning of a value.
enum ValueSemantic {
  label,
  description,
  useCount,
  onOffSwitch,
  date,
  revision,
}

/// Base wrapper that is implemented by all view values.
sealed class ViewValue<T> {
  /// Return the enumerated meaning of this value.
  ValueSemantic get semantic;

  /// Returns the [StringSelector] function that provides the localised String
  /// for th label of this value.
  StringSelector get label;

  /// Returns the [StringSelector] function that provides the localised String
  /// for the tooltip of this value.
  StringSelector get tooltip;

  /// The value that is to be rendered.
  Option<T> get value;
}
