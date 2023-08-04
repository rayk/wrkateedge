part of '../value_elements.dart';

/// A switch widget that allows the user to toggle the value from true to false
/// and vice versa.
class ToggleSwitch extends StatelessWidget {
  final ViewValue<bool> value;

  const ToggleSwitch({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Tooltip(
        message: value.tooltip(context),
        child: Semantics(
          label: value.semantic.name,
          toggled: value.value.getOrElse(() => false),
          child: Switch(
            value: value.value.getOrElse(() => false),
            onChanged: (_) => value
                .getCommand<ToggleBoolCmd>()
                .match(() {}, (t) => t.task().run()),
          ),
        ),
      );
}
