import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/notifier.dart';

const cardInfoBarKey = Key('cardInfoBar');

class CardInfoBar extends HookConsumerWidget {
  final CardState state;

  const CardInfoBar({super.key = cardInfoBarKey, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Last Updated: ${state.updatedOn.toIso8601String()}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Cards: ${state.cardViews.length.toString()}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      );
}
