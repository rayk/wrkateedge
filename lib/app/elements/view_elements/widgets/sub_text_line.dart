part of '../value_elements.dart';

/// Text line that is secondary to the main text line.
class SubTextLine extends StatelessWidget {
  final ViewValue<String> value;

  const SubTextLine({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => value.value.match(
        () => const SizedBox.shrink(),
        (t) => Text(
          t,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
      );
}
