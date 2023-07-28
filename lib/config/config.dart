/// Contains all the static configuration values for the application.
///
/// {@category Config}
library config;

/// Compile time static configuration values, that are set from the environment
/// during build time.
///
/// {@category Config}
class ConfigValues {
  /// The name of the application.
  static const String appName = String.fromEnvironment('APP_NAME');

  /// The version number of this build of the application.
  static const String appVersion = String.fromEnvironment('APP_VERSION');

  /// Defines the log level for the application.
  static const int logLevel = int.fromEnvironment('LOG_LEVEL');

  /// Should the debug banner be shown on the material app.
  static const bool showDebugBanner = bool.fromEnvironment('SHOW_DEBUG_BANNER');

  /// Should the provides be observed and logged.
  static const bool observeProviders =
      bool.fromEnvironment('OBSERVE_PROVIDERS');
}
