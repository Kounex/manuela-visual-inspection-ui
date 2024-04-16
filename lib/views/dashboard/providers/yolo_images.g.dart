// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yolo_images.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$yOLOImagesStreamHash() => r'd1f03ca1bee4f5380abe164b173380db9b86b58c';

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

/// See also [yOLOImagesStream].
@ProviderFor(yOLOImagesStream)
const yOLOImagesStreamProvider = YOLOImagesStreamFamily();

/// See also [yOLOImagesStream].
class YOLOImagesStreamFamily extends Family<AsyncValue<YOLOImage>> {
  /// See also [yOLOImagesStream].
  const YOLOImagesStreamFamily();

  /// See also [yOLOImagesStream].
  YOLOImagesStreamProvider call({
    bool? mockMode,
  }) {
    return YOLOImagesStreamProvider(
      mockMode: mockMode,
    );
  }

  @override
  YOLOImagesStreamProvider getProviderOverride(
    covariant YOLOImagesStreamProvider provider,
  ) {
    return call(
      mockMode: provider.mockMode,
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
  String? get name => r'yOLOImagesStreamProvider';
}

/// See also [yOLOImagesStream].
class YOLOImagesStreamProvider extends AutoDisposeStreamProvider<YOLOImage> {
  /// See also [yOLOImagesStream].
  YOLOImagesStreamProvider({
    bool? mockMode,
  }) : this._internal(
          (ref) => yOLOImagesStream(
            ref as YOLOImagesStreamRef,
            mockMode: mockMode,
          ),
          from: yOLOImagesStreamProvider,
          name: r'yOLOImagesStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$yOLOImagesStreamHash,
          dependencies: YOLOImagesStreamFamily._dependencies,
          allTransitiveDependencies:
              YOLOImagesStreamFamily._allTransitiveDependencies,
          mockMode: mockMode,
        );

  YOLOImagesStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mockMode,
  }) : super.internal();

  final bool? mockMode;

  @override
  Override overrideWith(
    Stream<YOLOImage> Function(YOLOImagesStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: YOLOImagesStreamProvider._internal(
        (ref) => create(ref as YOLOImagesStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mockMode: mockMode,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<YOLOImage> createElement() {
    return _YOLOImagesStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YOLOImagesStreamProvider && other.mockMode == mockMode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mockMode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin YOLOImagesStreamRef on AutoDisposeStreamProviderRef<YOLOImage> {
  /// The parameter `mockMode` of this provider.
  bool? get mockMode;
}

class _YOLOImagesStreamProviderElement
    extends AutoDisposeStreamProviderElement<YOLOImage>
    with YOLOImagesStreamRef {
  _YOLOImagesStreamProviderElement(super.provider);

  @override
  bool? get mockMode => (origin as YOLOImagesStreamProvider).mockMode;
}

String _$damagedYOLOImagesHash() => r'1498b638d40288a424f514226ad48ba36f7df5db';

/// See also [damagedYOLOImages].
@ProviderFor(damagedYOLOImages)
final damagedYOLOImagesProvider = AutoDisposeProvider<List<YOLOImage>>.internal(
  damagedYOLOImages,
  name: r'damagedYOLOImagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$damagedYOLOImagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DamagedYOLOImagesRef = AutoDisposeProviderRef<List<YOLOImage>>;
String _$yOLOImagesHash() => r'25f7b0cdc782785d4ab13cb00029681a92530692';

/// See also [YOLOImages].
@ProviderFor(YOLOImages)
final yOLOImagesProvider =
    NotifierProvider<YOLOImages, List<YOLOImage>>.internal(
  YOLOImages.new,
  name: r'yOLOImagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$yOLOImagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$YOLOImages = Notifier<List<YOLOImage>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
