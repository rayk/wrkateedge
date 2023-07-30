part of 'notifier.dart';

/// Contains the state of the [CardNotifier].
@freezed
class CardState with _$CardState {
  const factory CardState({required String uid}) = _CardState;
  const CardState._();
}
