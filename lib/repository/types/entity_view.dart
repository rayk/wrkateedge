part of 'types.dart';

/// An interface for a structure that is returned by the repository containing
/// data from a Domain Entity mapped in such a way as to simplify the rendering
/// of the data.
///
/// Consumers of the repository would create implementations of this interface
/// the are created based on Domain Entity.
abstract class EntityView {
  /// Returns a map of the entity's values.
  Map<String, dynamic> toMap();
}
