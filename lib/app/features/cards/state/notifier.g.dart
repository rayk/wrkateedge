// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardEntitySelectHash() => r'4c6f9c274d1ca9f9e1f236273c085bf39eda64c0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef CardEntitySelectRef = AutoDisposeProviderRef<CardEntityView>;

/// See also [cardEntitySelect].
@ProviderFor(cardEntitySelect)
const cardEntitySelectProvider = CardEntitySelectFamily();

/// See also [cardEntitySelect].
class CardEntitySelectFamily extends Family<CardEntityView> {
  /// See also [cardEntitySelect].
  const CardEntitySelectFamily();

  /// See also [cardEntitySelect].
  CardEntitySelectProvider call(
    String uuid,
  ) {
    return CardEntitySelectProvider(
      uuid,
    );
  }

  @override
  CardEntitySelectProvider getProviderOverride(
    covariant CardEntitySelectProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cardEntitySelectProvider';
}

/// See also [cardEntitySelect].
class CardEntitySelectProvider extends AutoDisposeProvider<CardEntityView> {
  /// See also [cardEntitySelect].
  CardEntitySelectProvider(
    this.uuid,
  ) : super.internal(
          (ref) => cardEntitySelect(
            ref,
            uuid,
          ),
          from: cardEntitySelectProvider,
          name: r'cardEntitySelectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cardEntitySelectHash,
          dependencies: CardEntitySelectFamily._dependencies,
          allTransitiveDependencies:
              CardEntitySelectFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is CardEntitySelectProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$cardNotifierHash() => r'0ddcd91c285fba5fdf4de0a8fdf261f02aafb1b5';

/// See also [CardNotifier].
@ProviderFor(CardNotifier)
final cardNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CardNotifier, CardState>.internal(
  CardNotifier.new,
  name: r'cardNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cardNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CardNotifier = AutoDisposeAsyncNotifier<CardState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
