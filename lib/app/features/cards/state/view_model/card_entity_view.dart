import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wrkateedge/app/features/cards/state/notifier.dart';
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
      label: (ctx) => AppString.of(ctx).card_label,
      tooltip: (ctx) => AppString.of(ctx).card_label_tooltip,
      source: _sourceEntity.label);

  /// Description for the card.
  ParagraphValue get description => ParagraphValue(
      semantic: ValueSemantic.description,
      label: (ctx) => AppString.of(ctx).card_description_label,
      tooltip: (ctx) => AppString.of(ctx).card_description_tooltip,
      source: _sourceEntity.description);

  /// Flag indicating if the card is default.
  DefaultFlagValue get isDefault => DefaultFlagValue(
      semantic: ValueSemantic.onOffSwitch,
      label: (ctx) => AppString.of(ctx).placeholderForLabel,
      tooltip: (ctx) => AppString.of(ctx).placeholderForTooltip,
      source: _sourceEntity.isDefault);

  /// Flag indicating if the card is action.
  ActiveFlagValue get isActive => ActiveFlagValue(
      semantic: ValueSemantic.onOffSwitch,
      label: (ctx) => AppString.of(ctx).card_active_switch_label,
      tooltip: (ctx) => AppString.of(ctx).card_active_switch_tooltip,
      source: _sourceEntity.isActive);

  CardEntity flipDefault() {
    final updated = _sourceEntity.isDefault.toggle();
    return _sourceEntity.rebuild((b) => b..isDefault = updated.toBuilder());
  }

  CardEntity flipActive() {
    final updated = _sourceEntity.isActive.toggle();
    return _sourceEntity.rebuild((b) => b..isActive = updated.toBuilder());
  }

  /// Returns a OpState whilst attempting to toggle the default flag.
  Future<OpState> toggle(WidgetRef ref) {
    final cmp = Completer<OpState>();

    ref
        .watch(cardNotifierProvider.notifier)
        .toggleDefaultFlag(this)
        .then((value) => cmp.complete(OpState.ready));

    return cmp.future;
  }
}
