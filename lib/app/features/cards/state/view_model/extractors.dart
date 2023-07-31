import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../repository/card_repository/card_repository.dart';
import '../../../../elements/elements.dart';
import 'card_entity_view.dart';

Function throwMissingKeyField =
    () => throw ArgumentError('A key field is missing!');

/// Returns a value extractor that produces a [CardEntityView] for a given [CardEntity].
final cardEntityViewExtractor = Reader<CardEntity, CardEntityView>(
  (entity) => CardEntityView(
    ref: entity.uuid.value.getOrElse(throwMissingKeyField()),
    revision: entity.revision.value.getOrElse(throwMissingKeyField()),
    values: IList<ViewValue>(),
  ),
);
