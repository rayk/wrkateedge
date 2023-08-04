import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkateedge/repository/localizations/l10n.dart';

import '../state/notifier.dart';

const cardInfoBarKey = Key('cardInfoBar');

class CardCommandBar extends HookConsumerWidget {
  const CardCommandBar({
    super.key = cardInfoBarKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(cardNotifierProvider).when(
          data: (state) => Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '${AppString.of(context).card_feature_last_updated_label}: ${state.updatedOn.toIso8601String()}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${AppString.of(context).card_feature_card_count_label}: ${state.cardViews.length.toString()}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<Object>(
                        items: [
                          DropdownMenuItem(child: Text('All')),
                        ],
                        onChanged: (Object? value) {},
                      ))
                ],
              ),
          error: (error, stack) => ErrorWidget(error),
          loading: () => const CircularProgressIndicator());
}
