import 'dart:async';

import 'package:squadron/squadron.dart';
import 'package:squadron/squadron_annotations.dart';

import 'live_feed.activator.g.dart';

part 'live_feed.worker.g.dart';

@SquadronService()
class LiveFeedService implements WorkerService {
  @SquadronMethod()
  Stream<double> pulse() async* {
    var n = 0;
    while (true) {
      yield n.toDouble();
      n += 1;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  Map<int, CommandHandler> get operations => throw UnimplementedError();
}
