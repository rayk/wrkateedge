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
        child: ListTile(
            leading: ToggleSwitch(
              value: card.isDefault,
              onChanged: (value) => ref
                  .read(cardNotifierProvider.notifier)
                  .toggleDefaultFlag(card),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextLineSingle(value: card.label),
            ),
            subtitle: TextLineMultiple(value: card.description),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 100,
                  child: Text('Chart 1'),
                ),
                SizedBox(width: 100, height: 100, child: Text('Chart Two'))
              ],
            )));
  }
}
