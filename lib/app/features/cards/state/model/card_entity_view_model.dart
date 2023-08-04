part of 'card_feature_model.dart';

@immutable
class CardEntityView extends ViewableObject {
  @override
  final String ref;

  @override
  final int revision;

  /// The domain entity the view is based upon.
  final CardEntity _srcEntity;

  const CardEntityView({
    required this.ref,
    required this.revision,
    required CardEntity source,
  })  : _srcEntity = source,
        super();

  /// Label for the card.
  TextValue get label => TextValue(
        semantic: ValueSemantic.label,
        label: (ctx) => AppString.of(ctx).card_label,
        tooltip: (ctx) => AppString.of(ctx).card_label_tooltip,
        source: _srcEntity.label,
      );

  ParagraphValue get description => ParagraphValue(
        semantic: ValueSemantic.description,
        label: (ctx) => AppString.of(ctx).card_description_label,
        tooltip: (ctx) => AppString.of(ctx).card_description_tooltip,
        source: _srcEntity.description,
      );

  DefaultFlagValue get isDefault => DefaultFlagValue(
        semantic: ValueSemantic.onOffSwitch,
        label: (ctx) => AppString.of(ctx).placeholderForLabel,
        tooltip: (ctx) => AppString.of(ctx).placeholderForTooltip,
        source: _srcEntity.isDefault,
      );

  ActiveFlagValue get isActive => ActiveFlagValue(
        semantic: ValueSemantic.onOffSwitch,
        label: (ctx) => AppString.of(ctx).card_active_switch_label,
        tooltip: (ctx) => AppString.of(ctx).card_active_switch_tooltip,
        source: _srcEntity.isActive,
      );

  @override
  String toString() {
    final sb = StringBuffer();

    sb.writeln('<CardEntityView> from <CardEntity>');
    sb.writeln('  ref: $ref');
    sb.writeln('  revision: $revision');
    sb.writeln('  label: $label');
    sb.writeln('  description: $description');
    sb.writeln('  isDefault: $isDefault');
    sb.writeln('  isActive: $isActive');

    return sb.toString();
  }

  @override
  IList<ViewValue> get values =>
      IList([label, description, isDefault, isActive]);

  @override
  IList<ViewCommand> get commands => throw UnimplementedError();
}
