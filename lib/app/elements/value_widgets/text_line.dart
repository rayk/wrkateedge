part of 'value_widgets.dart';

/// Displays a single line of text, with a label.
class TextLineSingle extends StatelessWidget {
  final bool isEnabled;
  final ViewValue<String> value;

  const TextLineSingle({super.key, required this.value, this.isEnabled = true});

  @override
  Widget build(BuildContext context) => value.value.match(
        () => const SizedBox.shrink(),
        (t) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Tooltip(
              message: isEnabled ? value.tooltip(context) : '',
              child: Text(
                t,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isEnabled
                        ? Theme.of(context).textTheme.bodyLarge?.color
                        : Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                semanticsLabel: value.semantic.toString(),
              ),
            ),
            Text(
              value.label(context),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isEnabled
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(0.5),
                  ),
            )
          ],
        ),
      );
}

/// Displays multiple lines of text, with a label.
class TextLineMultiple extends StatelessWidget {
  final bool isEnabled;
  final ViewValue<String> value;

  const TextLineMultiple({
    super.key,
    required this.value,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) => value.value.match(
        () => const SizedBox.shrink(),
        (t) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Tooltip(
              message: value.tooltip(context),
              child: Text(
                t,
                style: Theme.of(context).textTheme.titleSmall,
                semanticsLabel: value.semantic.toString(),
              ),
            ),
            Text(
              value.label(context),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isEnabled
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(0.9),
                  ),
            )
          ],
        ),
      );
}
