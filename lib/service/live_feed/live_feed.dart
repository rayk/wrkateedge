import 'package:squadron/squadron.dart';
import 'package:squadron/squadron_annotations.dart';

part 'live_feed.worker.g.dart';

@SquadronService()
class LiveFeedService implements WorkerService {
  @SquadronMethod()
  Future getLiveFeed({required String payload}) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Stream<double> pulse() async* {
    var n = 0;
    while (true) {
      yield n.toDouble();
      n += 1;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  static const getFeed = 1;

  @override
  Map<int, CommandHandler> get operations => {
        getFeed: (WorkerRequest req) => getLiveFeed(payload: req.args[0]),
      };
}
