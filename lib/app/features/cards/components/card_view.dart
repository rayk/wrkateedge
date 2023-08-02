import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wrkateedge/app/elements/value_widgets/value_widgets.dart';
import 'package:wrkateedge/app/features/cards/components/live_feed.dart';

import '../state/notifier.dart';

///
/// The main focus here is the layout of the CardEntityView. The actual
/// values are handled by the view value widgets.
class CardView extends ConsumerWidget {
  final String subjectRef;

  const CardView({super.key, required this.subjectRef});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final card = ref.watch(cardEntitySelectProvider(subjectRef));
        final maxWidth = constraints.maxWidth;
        final graphWith = maxWidth * 0.61;

        final isEnabled = card.isActive.value.getOrElse(() => false);

        return Card(
            margin: const EdgeInsets.all(8.0),
            key: Key(card.ref),
            child: SizedBox(
              height: isEnabled ? 275 : 150,
              child: ListTile(
                isThreeLine: isEnabled,
                leading: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(),
                    ToggleSwitch(
                      value: card.isActive,
                      onChanged: (_) => ref
                          .read(cardNotifierProvider.notifier)
                          .toggleActiveFlag(card),
                    ),
                  ],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                  child: TextLineSingle(
                    value: card.label,
                    isEnabled: isEnabled,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height: isEnabled ? 100 : 50,
                              width: graphWith / 3,
                              child: LiveFeed(
                                isEnabled: isEnabled,
                              )),
                          SizedBox(
                              height: isEnabled ? 100 : 50,
                              width: graphWith / 3,
                              child: LiveFeed(
                                isEnabled: isEnabled,
                              )),
                          SizedBox(
                              height: isEnabled ? 100 : 50,
                              width: graphWith / 3,
                              child: LiveFeed(
                                isEnabled: isEnabled,
                              )),
                        ],
                      ),
                    ),
                    TextLineMultiple(
                        value: card.description, isEnabled: isEnabled),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: SubTextLine(
                            rawValue: card.ref,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: SubTextLine(
                            rawValue: card.revision.toString(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
