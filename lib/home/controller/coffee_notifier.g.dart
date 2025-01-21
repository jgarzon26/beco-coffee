// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getRandomCoffeesHash() => r'c3b61365668beb526e16cd119969a3a3c6f9c400';

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

/// See also [getRandomCoffees].
@ProviderFor(getRandomCoffees)
const getRandomCoffeesProvider = GetRandomCoffeesFamily();

/// See also [getRandomCoffees].
class GetRandomCoffeesFamily extends Family<AsyncValue<List<Coffee>>> {
  /// See also [getRandomCoffees].
  const GetRandomCoffeesFamily();

  /// See also [getRandomCoffees].
  GetRandomCoffeesProvider call({
    int count = 4,
  }) {
    return GetRandomCoffeesProvider(
      count: count,
    );
  }

  @override
  GetRandomCoffeesProvider getProviderOverride(
    covariant GetRandomCoffeesProvider provider,
  ) {
    return call(
      count: provider.count,
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
  String? get name => r'getRandomCoffeesProvider';
}

/// See also [getRandomCoffees].
class GetRandomCoffeesProvider extends AutoDisposeFutureProvider<List<Coffee>> {
  /// See also [getRandomCoffees].
  GetRandomCoffeesProvider({
    int count = 4,
  }) : this._internal(
          (ref) => getRandomCoffees(
            ref as GetRandomCoffeesRef,
            count: count,
          ),
          from: getRandomCoffeesProvider,
          name: r'getRandomCoffeesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRandomCoffeesHash,
          dependencies: GetRandomCoffeesFamily._dependencies,
          allTransitiveDependencies:
              GetRandomCoffeesFamily._allTransitiveDependencies,
          count: count,
        );

  GetRandomCoffeesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.count,
  }) : super.internal();

  final int count;

  @override
  Override overrideWith(
    FutureOr<List<Coffee>> Function(GetRandomCoffeesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRandomCoffeesProvider._internal(
        (ref) => create(ref as GetRandomCoffeesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Coffee>> createElement() {
    return _GetRandomCoffeesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRandomCoffeesProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetRandomCoffeesRef on AutoDisposeFutureProviderRef<List<Coffee>> {
  /// The parameter `count` of this provider.
  int get count;
}

class _GetRandomCoffeesProviderElement
    extends AutoDisposeFutureProviderElement<List<Coffee>>
    with GetRandomCoffeesRef {
  _GetRandomCoffeesProviderElement(super.provider);

  @override
  int get count => (origin as GetRandomCoffeesProvider).count;
}

String _$getPromotionCoffeesHash() =>
    r'7efdfac2ffc27a7e5e027aeca61e9b636aa7cd14';

/// See also [getPromotionCoffees].
@ProviderFor(getPromotionCoffees)
const getPromotionCoffeesProvider = GetPromotionCoffeesFamily();

/// See also [getPromotionCoffees].
class GetPromotionCoffeesFamily extends Family<AsyncValue<List<Coffee>>> {
  /// See also [getPromotionCoffees].
  const GetPromotionCoffeesFamily();

  /// See also [getPromotionCoffees].
  GetPromotionCoffeesProvider call({
    int count = 7,
  }) {
    return GetPromotionCoffeesProvider(
      count: count,
    );
  }

  @override
  GetPromotionCoffeesProvider getProviderOverride(
    covariant GetPromotionCoffeesProvider provider,
  ) {
    return call(
      count: provider.count,
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
  String? get name => r'getPromotionCoffeesProvider';
}

/// See also [getPromotionCoffees].
class GetPromotionCoffeesProvider
    extends AutoDisposeFutureProvider<List<Coffee>> {
  /// See also [getPromotionCoffees].
  GetPromotionCoffeesProvider({
    int count = 7,
  }) : this._internal(
          (ref) => getPromotionCoffees(
            ref as GetPromotionCoffeesRef,
            count: count,
          ),
          from: getPromotionCoffeesProvider,
          name: r'getPromotionCoffeesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPromotionCoffeesHash,
          dependencies: GetPromotionCoffeesFamily._dependencies,
          allTransitiveDependencies:
              GetPromotionCoffeesFamily._allTransitiveDependencies,
          count: count,
        );

  GetPromotionCoffeesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.count,
  }) : super.internal();

  final int count;

  @override
  Override overrideWith(
    FutureOr<List<Coffee>> Function(GetPromotionCoffeesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPromotionCoffeesProvider._internal(
        (ref) => create(ref as GetPromotionCoffeesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Coffee>> createElement() {
    return _GetPromotionCoffeesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPromotionCoffeesProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetPromotionCoffeesRef on AutoDisposeFutureProviderRef<List<Coffee>> {
  /// The parameter `count` of this provider.
  int get count;
}

class _GetPromotionCoffeesProviderElement
    extends AutoDisposeFutureProviderElement<List<Coffee>>
    with GetPromotionCoffeesRef {
  _GetPromotionCoffeesProviderElement(super.provider);

  @override
  int get count => (origin as GetPromotionCoffeesProvider).count;
}

String _$coffeeNotifierHash() => r'9458b9ee29cb150a6f21775c19a2d2d16fe8d51f';

/// See also [CoffeeNotifier].
@ProviderFor(CoffeeNotifier)
final coffeeNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CoffeeNotifier, List<Coffee>>.internal(
  CoffeeNotifier.new,
  name: r'coffeeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$coffeeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CoffeeNotifier = AutoDisposeAsyncNotifier<List<Coffee>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
