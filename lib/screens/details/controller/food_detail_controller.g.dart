// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foodDetailControllerHash() =>
    r'3578db28ed9f12d388cc184ffdb56572ba86ebe0';

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

/// See also [foodDetailController].
@ProviderFor(foodDetailController)
const foodDetailControllerProvider = FoodDetailControllerFamily();

/// See also [foodDetailController].
class FoodDetailControllerFamily extends Family<AsyncValue<FoodItem?>> {
  /// See also [foodDetailController].
  const FoodDetailControllerFamily();

  /// See also [foodDetailController].
  FoodDetailControllerProvider call({
    required int index,
  }) {
    return FoodDetailControllerProvider(
      index: index,
    );
  }

  @override
  FoodDetailControllerProvider getProviderOverride(
    covariant FoodDetailControllerProvider provider,
  ) {
    return call(
      index: provider.index,
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
  String? get name => r'foodDetailControllerProvider';
}

/// See also [foodDetailController].
class FoodDetailControllerProvider
    extends AutoDisposeFutureProvider<FoodItem?> {
  /// See also [foodDetailController].
  FoodDetailControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => foodDetailController(
            ref as FoodDetailControllerRef,
            index: index,
          ),
          from: foodDetailControllerProvider,
          name: r'foodDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$foodDetailControllerHash,
          dependencies: FoodDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              FoodDetailControllerFamily._allTransitiveDependencies,
          index: index,
        );

  FoodDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<FoodItem?> Function(FoodDetailControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FoodDetailControllerProvider._internal(
        (ref) => create(ref as FoodDetailControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FoodItem?> createElement() {
    return _FoodDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodDetailControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FoodDetailControllerRef on AutoDisposeFutureProviderRef<FoodItem?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _FoodDetailControllerProviderElement
    extends AutoDisposeFutureProviderElement<FoodItem?>
    with FoodDetailControllerRef {
  _FoodDetailControllerProviderElement(super.provider);

  @override
  int get index => (origin as FoodDetailControllerProvider).index;
}

String _$foodLessonListControllerHash() =>
    r'e0de729e368e1387a00833c08c5da2387ea7a0db';

/// See also [foodLessonListController].
@ProviderFor(foodLessonListController)
const foodLessonListControllerProvider = FoodLessonListControllerFamily();

/// See also [foodLessonListController].
class FoodLessonListControllerFamily
    extends Family<AsyncValue<List<LessonItem>?>> {
  /// See also [foodLessonListController].
  const FoodLessonListControllerFamily();

  /// See also [foodLessonListController].
  FoodLessonListControllerProvider call({
    required int index,
  }) {
    return FoodLessonListControllerProvider(
      index: index,
    );
  }

  @override
  FoodLessonListControllerProvider getProviderOverride(
    covariant FoodLessonListControllerProvider provider,
  ) {
    return call(
      index: provider.index,
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
  String? get name => r'foodLessonListControllerProvider';
}

/// See also [foodLessonListController].
class FoodLessonListControllerProvider
    extends AutoDisposeFutureProvider<List<LessonItem>?> {
  /// See also [foodLessonListController].
  FoodLessonListControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => foodLessonListController(
            ref as FoodLessonListControllerRef,
            index: index,
          ),
          from: foodLessonListControllerProvider,
          name: r'foodLessonListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$foodLessonListControllerHash,
          dependencies: FoodLessonListControllerFamily._dependencies,
          allTransitiveDependencies:
              FoodLessonListControllerFamily._allTransitiveDependencies,
          index: index,
        );

  FoodLessonListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<List<LessonItem>?> Function(FoodLessonListControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FoodLessonListControllerProvider._internal(
        (ref) => create(ref as FoodLessonListControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LessonItem>?> createElement() {
    return _FoodLessonListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodLessonListControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FoodLessonListControllerRef
    on AutoDisposeFutureProviderRef<List<LessonItem>?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _FoodLessonListControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<LessonItem>?>
    with FoodLessonListControllerRef {
  _FoodLessonListControllerProviderElement(super.provider);

  @override
  int get index => (origin as FoodLessonListControllerProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
