import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_state.dart';
part 'notifier.freezed.dart';
part 'notifier.g.dart';

@riverpod
class CardNotifier extends _$CardNotifier {
  @override
  Future<CardState> build() async {
    return CardState(uid: '');
  }
}
