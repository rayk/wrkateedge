/// Entry library, contains the code required to initialise and kickoff the
/// application.
///
/// {@category Startup}
library entry;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:wrkateedge/config/config.dart';
import 'package:wrkateedge/service/live_feed/live_feed.dart';
import 'package:wrkateedge/startup/startup.dart';

import 'app/app.dart';

/// Main Application entry point from which the application is executed from.
///
/// Responsible for:
/// - Initialization of runtime dependencies.
/// - Provider setup that allows consumers can get required runtime dependencies.
///
/// Depends on:
/// - [ConfigValues] that drives the runtime configuration of the application.
/// - [WrkAteEdgeApp] that contains the GUI elements of the application.
///
/// {@category Startup}
void main() async {
  Loggy.initLoggy(
    logOptions: LogOptions(
      LogLevel.values
          .firstWhere((level) => level.priority == ConfigValues.logLevel),
    ),
  );

  final worker = LiveFeedServiceWorker();

  await worker.start();

  runApp(
    ProviderScope(
      overrides: [],
      observers: [if (ConfigValues.observeProviders) ProviderDebugObserver()],
      child: const WrkAteEdgeApp(
        appVersion: ConfigValues.appVersion,
        showDebugBanner: ConfigValues.showDebugBanner,
      ),
    ),
  );
}
