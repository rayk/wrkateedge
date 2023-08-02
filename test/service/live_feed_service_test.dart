import 'package:flutter_test/flutter_test.dart';
import 'package:wrkateedge/service/live_feed/live_feed.dart';

void main() async {
  final worker = LiveFeedServiceWorker();

  setUp(() async {
    await worker.start();
    assert(worker.isStopped == false);
  });

  test('Should be in a running IDLE state.', () {
    expect(worker.isStopped, isFalse);
    expect(worker.status, 'IDLE');
  });

  test('Should return a stream to listen on.', () {
    expect(worker.pulse(), isA<Stream<double>>());
  });
}
