import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrkateedge/repository/card_repository/card_repository.dart';

part 'card_state.dart';
part 'notifier.freezed.dart';
part 'notifier.g.dart';

@riverpod
class CardNotifier extends _$CardNotifier {
  late CardRepository _cardRepo;

  @override
  Future<CardState> build() async {
    _cardRepo = ref.watch<CardRepository>(cardRepositoryProvider);

    return CardState(uid: '');
  }
}
