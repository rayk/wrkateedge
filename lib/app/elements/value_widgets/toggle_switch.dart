part of 'value_widgets.dart';

class ToggleSwitch extends HookConsumerWidget {
  final ViewValue<bool> value;
  final Function(WidgetRef) onChanged;

  const ToggleSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Tooltip(
      message: value.tooltip(context),
      child: Switch(
          value: value.value.getOrElse(() => false),
          onChanged: (_) => onChanged(ref)),
    );
  }
}
