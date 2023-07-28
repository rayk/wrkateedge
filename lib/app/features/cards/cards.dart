/// The card feature.
library cards;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkateedge/app/features/cards/state/notifier.dart';

/// Card feature top level widget.
class CardFeature extends HookConsumerWidget {
  const CardFeature({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(cardNotifierProvider).when(
            data: (state) => ListView(
              primary: true,
              children: const [ListTile()],
            ),
            error: (error, stack) => Center(
              child: Text('Error: $error \n $stack'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
}
