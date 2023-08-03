/// The card feature.
///
/// {@category Features}
library cards;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wrkateedge/app/features/cards/components/card_info_bar.dart';
import 'package:wrkateedge/app/features/cards/components/card_view.dart';
import 'package:wrkateedge/app/features/cards/state/notifier.dart';

const appBarContainerKey = Key('appbarContainerKey');

/// Card feature top level widget responsible for hookup and and lifecycle
/// of the card feature.
class CardFeature extends HookConsumerWidget {
  const CardFeature({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(cardNotifierProvider).when(
            data: (state) => CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  key: appBarContainerKey,
                  title: CardInfoBar(state: state),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CardView(
                      subjectRef: state.cardViews[index].ref,
                    ),
                    childCount: state.cardViews.length,
                  ),
                ),
              ],
            ),
            error: (error, stack) => Center(
              child: Text('Error: $error \n $stack'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
}
