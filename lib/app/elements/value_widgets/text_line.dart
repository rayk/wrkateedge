part of 'value_widgets.dart';

/// Displays a single line of text, with a label.
class TextLineSingle extends StatelessWidget {
  final ViewValue<String> value;

  const TextLineSingle({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return value.value.match(
        () => const SizedBox.shrink(),
        (t) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  semanticsLabel: value.semantic.toString(),
                ),
                Text(
                  value.label(context),
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ));
  }
}

/// Displays multiple lines of text, with a label.
class TextLineMultiple extends StatelessWidget {
  final ViewValue<String> value;

  const TextLineMultiple({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return value.value.match(
        () => const SizedBox.shrink(),
        (t) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t,
                  style: Theme.of(context).textTheme.titleSmall,
                  semanticsLabel: value.semantic.toString(),
                ),
                Text(
                  value.label(context),
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ));
  }
}
