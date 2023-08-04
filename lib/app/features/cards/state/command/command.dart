import 'package:wrkateedge/app/features/cards/state/model/card_feature_model.dart';

part 'entity/toggle_active_flag.dart';
part 'state/create_card.dart';

/// Command that targets [T]
sealed class CardCommand<T> {}
