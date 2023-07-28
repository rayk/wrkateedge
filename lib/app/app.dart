/// Contains the GUI parts of the application, handles rending of the user
/// interface.
///
/// {@category App}
library app;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wrkateedge/app/theme/theme.dart';

import 'features/cards/cards.dart';

/// The top level widget that contains the application and has the primary
/// responsibility for the setup of the application.
///
/// {@category GUI}
class WrkAteEdgeApp extends StatelessWidget {
  final bool showDebugBanner;
  final String appVersion;

  const WrkAteEdgeApp({
    super.key,
    required this.showDebugBanner,
    required this.appVersion,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        key: Key(appVersion),
        darkTheme: defaultLightTheme,
        theme: defaultLightTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
        debugShowCheckedModeBanner: showDebugBanner,
        home: const Shell(),
      );
}

/// handles the setup and show up requirements.
class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WrkAteEdge Implementation')),
      body: const CardFeature(),
    );
  }
}
