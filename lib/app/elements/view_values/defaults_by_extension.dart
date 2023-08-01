part of 'view_values.dart';

extension LabelViewObjectHelper on Label {
  TextValue toViewValue() => TextValue(
        semantic: ValueSemantic.label,
        label: (ctx) => AppString.of(ctx).placeholderForLabel,
        tooltip: (ctx) => AppString.of(ctx).placeholderForTooltip,
        source: this,
      );
}
