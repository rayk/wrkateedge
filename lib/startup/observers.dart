part of 'startup.dart';

/// A [ProviderObserver] that logs all provider events to the console.
/// {@category Boot}
class ProviderDebugObserver extends ProviderObserver with ProviderLogger {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    loggy.debug(
      '|+ Added   : [${provider.name}] \t\t\t#${value.hashCode.toString().padRight(10).substring(0, 7)}... \t<${provider.runtimeType}>',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    loggy.debug(
      '|x Disposed:        : ${provider.runtimeType}',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    loggy.debug(
      '|^ Updated : [${provider.name}] #${previousValue.hashCode.toString().padRight(10).substring(0, 7)}... >-TO-> #${newValue.hashCode.toString().padRight(10).substring(0, 7)}...\t\t\t<${previousValue.runtimeType}>',
    );
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    loggy.debug(
      '|* Fail:    [${provider.name}] \t| <${provider.runtimeType}>,\tErrorType: ${error.runtimeType},',
    );
    loggy.error(
      '!! | Error Details --> $error',
    );
  }
}

mixin ProviderLogger implements LoggyType {
  @override
  Loggy<ProviderLogger> get loggy => Loggy<ProviderLogger>(
        'PVR: | ${runtimeType.toString().padRight(8).substring(0, 8)}',
      );
}
