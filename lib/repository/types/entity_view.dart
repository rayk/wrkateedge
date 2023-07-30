part of 'types.dart';

/// An interface for a structure that is returned by the repository containing
/// data from a Domain Entity mapped in such a way as to simplify the rendering
/// of the data.
///
/// Consumers of the repository would create implementations of this interface
/// the are created based on Domain Entity.
abstract class EntityView {
  /// Returns the unique identifier of the domain entity which was the source
  /// of this views values.
  String get ref;

  /// The revision number of the domain entity that this view is based on.
  int get revision;
}
