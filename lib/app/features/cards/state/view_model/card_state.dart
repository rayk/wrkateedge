part of '../notifier.dart';

/// Represents the overall state of the card feature.
@freezed
class CardState with _$CardState {
  const factory CardState({
    required String uid,
    required DateTime updatedOn,
    required IList<CardEntityView> cardViews,
  }) = _CardState;
  const CardState._();
}
