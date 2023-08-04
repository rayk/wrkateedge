import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:loggy/loggy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrkateedge/app/features/cards/state/model/card_feature_model.dart';
import 'package:wrkateedge/repository/card_repository/card_repository.dart';

import 'command/command.dart';

part 'notifier.g.dart';

@riverpod
class CardNotifier extends _$CardNotifier with UiLoggy {
  late CardRepository _cardRepo;

  Future<IList<CardEntityView>> _fetchCards() async {
    return await _cardRepo.getAllCards<CardEntityView>((
      extractor: cardEntityViewExtractor,
      params: {},
    )).run();
  }

  @override
  Future<CardFeatureModel> build() async {
    _cardRepo = ref.watch<CardRepository>(cardRepositoryProvider);

    return await _cardRepo
        .getAllCards<CardEntityView>((
          extractor: cardEntityViewExtractor,
          params: {},
        ))
        .map((cards) => CardFeatureModel(
              uid: '',
              updatedOn: DateTime.now().toLocal(),
              cardViews: cards,
              filter: CardFilter.all,
            ))
        .run();
  }

  /// Execute the passed in command.
  Future<Unit> execute(CardCommand cmd) async {
    loggy.debug('execute: $cmd');

    return unit;
  }

  Future<Unit> toggleDefaultFlag(CardEntityView card) async {
    loggy.debug('toggleDefaultFlag: ${card.ref}');

    final Task<CardEntityView> task = _cardRepo.patchCard(
      (
        params: {
          #ref: card.ref,
          #payload: card.flipDefault(),
        },
        extractor: cardEntityViewExtractor
      ),
    );

    state = await AsyncValue.guard(() async {
      final card = await task.run();
      return state.requireValue.copyWith(
          cardViews: state.requireValue.cardViews
              .map((e) => e.ref == card.ref ? card : e)
              .toIList());
    });

    return unit;
  }

  Future<Unit> toggleActiveFlag(CardEntityView card) async {
    loggy.debug('toggleActiveFlag: ${card.ref}');

    final Task<CardEntityView> task = _cardRepo.patchCard(
      (
        params: {
          #ref: card.ref,
          #payload: card.flipActive(),
        },
        extractor: cardEntityViewExtractor
      ),
    );

    state = await AsyncValue.guard(() async {
      final card = await task.run();
      return state.requireValue.copyWith(
          cardViews: state.requireValue.cardViews
              .map((e) => e.ref == card.ref ? card : e)
              .toIList());
    });

    return unit;
  }
}

@riverpod
CardEntityView cardEntitySelect(CardEntitySelectRef ref, String uuid) =>
    ref.watch<CardEntityView>(
      cardNotifierProvider.select((state) => state.requireValue.cardViews
          .firstWhere((element) => element.ref == uuid)),
    );
