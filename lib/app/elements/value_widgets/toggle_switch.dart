part of 'value_widgets.dart';

class ToggleSwitch extends StatelessWidget {
  final ViewValue<bool> value;
  final void Function(bool) onChanged;

  const ToggleSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value.value.match(
      () => const SizedBox.shrink(),
      (t) => Switch(
        value: value.value.getOrElse(() => false),
        onChanged: onChanged,
      ),
    );
  }
}
