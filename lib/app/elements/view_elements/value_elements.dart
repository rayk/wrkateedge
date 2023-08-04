/// Contains all the generic view types and and widgets to that supports
/// displaying those values.
library view_elements;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import '../../../domain/values/values.dart';

part 'commands/toggle_bool_cmd.dart';
part 'values/bool_toggle_value.dart';
part 'values/integer_value.dart';
part 'values/paragraph_value.dart';
part 'values/text_value.dart';
part 'widgets/sub_text_line.dart';
part 'widgets/text_line.dart';
part 'widgets/text_paragraph.dart';
part 'widgets/toggle_switch.dart';

/// Returns a the first view command of [T] from the passed in list of
/// [commands].
Option<K> selectCommand<K extends ViewCommand>(
  IList<ViewCommand> commands,
) =>
    Option<K>.of(commands.whereType<K>().first);

/// Signature of a function that return T when context is passed in.
typedef StringSelector = String Function(BuildContext context);

/// An Error from executing the command.
class CmdError {}

/// Base of all command outcomes.
sealed class CmdResult {}

/// Enumeration of the meaning of a value.
enum ValueSemantic {
  label,
  description,
  useCount,
  onOffSwitch,
  date,
  revision,
}

/// An interface for a structure that is returned by the repository containing
/// data from a Domain Entity mapped in such a way as to simplify the rendering
/// of the data.
///
/// Consumers of the repository would create implementations of this interface
/// the are created based on Domain Entity.
abstract class ViewableObject {
  /// Returns a list of commands that can be used to change this view object.
  IList<ViewCommand> get commands;

  /// Returns the unique identifier of the domain entity which was the source
  /// of this views values.
  String get ref;

  /// The revision number of the domain entity that this view is based on.
  int get revision;

  /// Returns a list of all the [ViewValue] objects that are available for this
  /// view entity. Used as to discover the properties in this view as well as
  /// bases for equality checks.
  IList<ViewValue> get values;
}

/// Base interface for command that be run from the GUI.
sealed class ViewCommand<T> {
  TaskEither<CmdError, CmdResult> task();
}

sealed class ViewValue<T> {
  /// Returns a list of commands that can be used to change this value.
  /// If there are no command that affect this value then the list is empty.
  IList<ViewCommand> get commands;

  /// Returns the [StringSelector] function that provides the localised String
  /// for th label of this value.
  StringSelector get label;

  /// Return the enumerated meaning of this value.
  ValueSemantic get semantic;

  /// Returns the [StringSelector] function that provides the localised String
  /// for the tooltip of this value.
  StringSelector get tooltip;

  /// The value that is to be rendered.
  Option<T> get value;

  /// Returns and options of the first command of type [K] from the commands
  /// in this value.
  Option<K> getCommand<K extends ViewCommand>();
}
