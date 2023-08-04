part of '../value_elements.dart';

/// Displays multiple lines of text, with a label and tooltips if provided.
class TextParagraph extends StatelessWidget {
  final ViewValue<String> value;

  const TextParagraph({
    super.key,
    required this.value,
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
                maxLines: 3,
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
