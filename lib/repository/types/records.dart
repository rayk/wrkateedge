part of 'types.dart';

/// A [Criterion] is a map of key/value pairs that are used to define a subset
/// of domain entities that should be returned by the repository.
typedef Criterion = Map<Symbol, dynamic>;

/// Records that defines a request to the repository for entity values.
typedef RepoRequest = ({
  /// Defines which domain entities should be returned by the repository.
  Criterion params,

  /// Defines what values from the domain entities should be included for
  /// rendering.
  ValueExtractor extractor,
});
