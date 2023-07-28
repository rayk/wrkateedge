/// Fake data store to support the reference implementation.
library store;

import 'dart:math';

final _rnd = Random();

/// Returns a random duration that represents the time associated with
/// async store operations.
Duration randomDelay() =>
    Duration(milliseconds: 300 + _rnd.nextInt(1200 - 300));

/// Represents a data store which handled the durability operations of
/// domain objects.
class FakeDataStore {}
