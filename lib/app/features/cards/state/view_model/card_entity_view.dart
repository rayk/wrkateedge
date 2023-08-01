import 'package:wrkateedge/domain/domain.dart';
import 'package:wrkateedge/repository/localizations/l10n.dart';
import 'package:wrkateedge/repository/repository.dart';

import '../../../../elements/elements.dart';

/// Represents a Card entity from the domain layer in a form that supports
/// rendering of the data.
class CardEntityView implements EntityView {
  @override
  final String ref;
  @override
  final int revision;

  final CardEntity _sourceEntity;

  const CardEntityView({
    required this.ref,
    required this.revision,
    required CardEntity entity,
  }) : _sourceEntity = entity;

  /// Label for the card.
  TextValue get label => TextValue(
      semantic: ValueSemantic.label,
      label: (ctx) => AppString.of(ctx).placeholderForLabel,
      tooltip: (ctx) => AppString.of(ctx).placeholderForTooltip,
      source: _sourceEntity.label);

  /// Description for the card.
  ParagraphValue get description => ParagraphValue(
      semantic: ValueSemantic.description,
      label: (ctx) => AppString.of(ctx).placeholderForLabel,
      tooltip: (ctx) => AppString.of(ctx).placeholderForTooltip,
      source: _sourceEntity.description);

  /// Flag indicating if the card is default.
  DefaultFlagValue get isDefault => DefaultFlagValue(
      semantic: ValueSemantic.onOffSwitch,
      label: (ctx) => AppString.of(ctx).placeholderForLabel,
      tooltip: (ctx) => AppString.of(ctx).placeholderForTooltip,
      source: _sourceEntity.isDefault);

  CardEntity toggle() {
    final updated = isDefault.toggle();
    return _sourceEntity.rebuild((b) => b..isDefault.replace(updated.value));
  }
}
