import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:wrkateedge/repository/repository.dart';

import '../../../../elements/elements.dart';

/// Represents a Card entity from the domain layer in a form that supports
/// rendering of the data.
class CardEntityView implements EntityView {
  @override
  final String ref;
  @override
  final int revision;

  final IList<ViewValue> values;

  const CardEntityView({
    required this.ref,
    required this.revision,
    required this.values,
  });
}
