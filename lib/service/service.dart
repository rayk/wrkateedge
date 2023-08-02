/// Contains the services that handle edge based processing work.
///
/// {@category Services}
library service;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'live_feed/live_feed.dart';

final liveFeedServiceProvider = Provider<LiveFeedService>((ref) {
  throw UnimplementedError('Live feed provide should be override at startup.');
});
