part of 'value_widgets.dart';

class SubTextLine extends StatelessWidget {
  final bool isEnabled;
  final String rawValue;

  const SubTextLine({
    super.key,
    required this.rawValue,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      rawValue,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ),
      maxLines: 1,
      overflow: TextOverflow.fade,
    );
  }
}
