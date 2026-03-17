// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FacilityController)
final facilityControllerProvider = FacilityControllerProvider._();

final class FacilityControllerProvider
    extends $AsyncNotifierProvider<FacilityController, List<FacilityModel>> {
  FacilityControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'facilityControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$facilityControllerHash();

  @$internal
  @override
  FacilityController create() => FacilityController();
}

String _$facilityControllerHash() =>
    r'71a3c85f75cbafc09c448cccaa922f0f901051fb';

abstract class _$FacilityController
    extends $AsyncNotifier<List<FacilityModel>> {
  FutureOr<List<FacilityModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<FacilityModel>>, List<FacilityModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<FacilityModel>>, List<FacilityModel>>,
        AsyncValue<List<FacilityModel>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
