import 'package:squadron/squadron.dart';
import 'package:squadron/squadron_annotations.dart';

part 'card_summarizer.worker.g.dart';

/// Service that produces a summary for a card object.
@SquadronService()
class CardSummarizerService implements WorkerService {
  @SquadronMethod()
  Future summarizeCard({required String payload}) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  static const summarize = 1;

  @override
  Map<int, CommandHandler> get operations => {
        summarize: (WorkerRequest req) => summarizeCard(payload: req.args[0]),
      };
}
