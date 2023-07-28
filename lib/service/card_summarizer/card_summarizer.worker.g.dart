// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_summarizer.dart';

// **************************************************************************
// Generator: WorkerGenerator 2.4.1
// **************************************************************************

/// WorkerService class for CardSummarizerService
class _$CardSummarizerServiceWorkerService extends CardSummarizerService
    implements WorkerService {
  _$CardSummarizerServiceWorkerService() : super();

  @override
  Map<int, CommandHandler> get operations => _operations;

  late final Map<int, CommandHandler> _operations = {
    _$summarizeCardId: ($) => summarizeCard(payload: $.args[0])
  };

  static const int _$summarizeCardId = 1;
}

/// Service initializer for CardSummarizerService
WorkerService $CardSummarizerServiceInitializer(WorkerRequest startRequest) =>
    _$CardSummarizerServiceWorkerService();

/// Operations map for CardSummarizerService
@Deprecated(
    'squadron_builder now supports "plain old Dart objects" as services. '
    'Services do not need to derive from WorkerService nor do they need to mix in '
    'with \$CardSummarizerServiceOperations anymore.')
mixin $CardSummarizerServiceOperations on WorkerService {
  @override
  // not needed anymore, generated for compatibility with previous versions of squadron_builder
  Map<int, CommandHandler> get operations => WorkerService.noOperations;
}

/// Worker for CardSummarizerService
class CardSummarizerServiceWorker extends Worker
    implements CardSummarizerService {
  CardSummarizerServiceWorker({PlatformWorkerHook? platformWorkerHook})
      : super($CardSummarizerServiceActivator,
            platformWorkerHook: platformWorkerHook);

  @override
  Future<dynamic> summarizeCard({String payload}) =>
      send(_$CardSummarizerServiceWorkerService._$summarizeCardId,
          args: [payload]);

  @override
  Map<int, FutureOr<dynamic> Function(List<dynamic>)> get operations =>
      throw UnimplementedError();
}

/// Worker pool for CardSummarizerService
class CardSummarizerServiceWorkerPool
    extends WorkerPool<CardSummarizerServiceWorker>
    implements CardSummarizerService {
  CardSummarizerServiceWorkerPool(
      {ConcurrencySettings? concurrencySettings,
      PlatformWorkerHook? platformWorkerHook})
      : super(
            () => CardSummarizerServiceWorker(
                platformWorkerHook: platformWorkerHook),
            concurrencySettings: concurrencySettings);

  @override
  Future<dynamic> summarizeCard({String payload}) =>
      execute((w) => w.summarizeCard(payload: payload));

  @override
  Map<int, FutureOr<dynamic> Function(List<dynamic>)> get operations =>
      throw UnimplementedError();
}
