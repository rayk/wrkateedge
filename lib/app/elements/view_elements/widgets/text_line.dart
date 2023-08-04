part of '../value_elements.dart';

/// Displays a single line of text, with a label and tooltip if provided.
class TextLine extends StatelessWidget {
  final ViewValue<String> value;

  const TextLine({
    super.key,
    required this.value,
    bool labelBelow = true,
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
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).textTheme.bodyLarge?.color),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                semanticsLabel: value.semantic.toString(),
              ),
            ),
            Text(
              value.label(context),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            )
          ],
        ),
      );
}
