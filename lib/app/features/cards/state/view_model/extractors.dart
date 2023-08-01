import 'package:fpdart/fpdart.dart';

import '../../../../../repository/card_repository/card_repository.dart';
import 'card_entity_view.dart';

/// Returns a value extractor that produces a [CardEntityView] for a given [CardEntity].
///
/// Extractor is where all the mapping is done and those mappings can be as
/// customised as required, other just call toViewValue on the [ValueObject] to
/// get the default mapping.
final cardEntityViewExtractor = Reader<CardEntity, CardEntityView>(
  (entity) => CardEntityView(
    entity: entity,
    ref: entity.uuid.value
        .getOrElse(() => throw ArgumentError('Uuid field is missing!')),
    revision: entity.revision.value
        .getOrElse(() => throw ArgumentError('Revision field is missing!')),
  ),
);
