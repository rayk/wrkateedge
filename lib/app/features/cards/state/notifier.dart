import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loggy/loggy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrkateedge/app/features/cards/state/view_model/card_entity_view.dart';
import 'package:wrkateedge/app/features/cards/state/view_model/extractors.dart';
import 'package:wrkateedge/repository/card_repository/card_repository.dart';

part 'notifier.freezed.dart';
part 'notifier.g.dart';
part 'view_model/card_state.dart';

@riverpod
class CardNotifier extends _$CardNotifier with UiLoggy {
  late CardRepository _cardRepo;

  @override
  Future<CardState> build() async {
    _cardRepo = ref.watch<CardRepository>(cardRepositoryProvider);

    return await _cardRepo
        .getAllCards<CardEntityView>(
            (extractor: cardEntityViewExtractor, params: {}))
        .map((cards) => CardState(
              uid: '',
              updatedOn: DateTime.now().toLocal(),
              cardViews: cards,
            ))
        .run();
  }

  Future<Unit> toggleDefaultFlag(CardEntityView card) async {
    loggy.debug('toggleDefaultFlag: ${card.ref}');

    state = await AsyncValue.guard(() async {
      return _cardRepo
          .patchCard((
            params: {
              #ref: ref,
              #payload: card.toggle(),
            },
            extractor: cardEntityViewExtractor,
          ))
          .map((a) => state.requireValue.cardViews
              .replaceAllWhere((element) => element.ref == a.ref, a))
          .run()
          .then((value) => state.requireValue.copyWith(cardViews: value));
    });

    return unit;
  }
}

@riverpod
CardEntityView cardEntitySelect(CardEntitySelectRef ref, String uuid) =>
    ref.watch(
      cardNotifierProvider.select((state) => state.requireValue.cardViews
          .firstWhere((element) => element.ref == uuid)),
    );
