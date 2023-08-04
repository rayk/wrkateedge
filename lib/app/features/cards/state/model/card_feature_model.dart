import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../../repository/localizations/l10n.dart';
import '../../../../elements/view_elements/value_elements.dart';

part 'card_entity_view_extractor.dart';
part 'card_entity_view_model.dart';
part 'card_feature_model.freezed.dart';

enum CardFilter {
  all,
  active,
  inactive,
}

/// Represents the overall state of the feature.
@freezed
class CardFeatureModel with _$CardFeatureModel {
  const factory CardFeatureModel({
    required String uid,
    required DateTime updatedOn,
    required CardFilter filter,
    required IList<CardEntityView> cardViews,
  }) = _CardFeatureModel;

  const CardFeatureModel._();
}
