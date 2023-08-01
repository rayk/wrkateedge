import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wrkateedge/app/elements/value_widgets/value_widgets.dart';

import '../state/notifier.dart';

///
/// The main focus here is the layout of the CardEntityView. The actual
/// values are handled by the view value widgets.
class CardView extends ConsumerWidget {
  final String subjectRef;

  const CardView({super.key, required this.subjectRef});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final card = ref.watch(cardEntitySelectProvider(subjectRef));

    return Card(
        margin: const EdgeInsets.all(8.0),
        key: Key(card.ref),
        child: SizedBox(
          height: 275,
          child: ListTile(
            isThreeLine: true,
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
              child: TextLineSingle(value: card.label),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColoredBox(
                        color: Colors.yellowAccent.shade100,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                      ColoredBox(
                        color: Colors.greenAccent.shade100,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                      ColoredBox(
                        color: Colors.blueAccent.shade100,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                TextLineMultiple(value: card.description),
              ],
            ),
          ),
        ));
  }
}
