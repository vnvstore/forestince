// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_facility_filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RequestFacilityFilterController)
final requestFacilityFilterControllerProvider =
    RequestFacilityFilterControllerProvider._();

final class RequestFacilityFilterControllerProvider extends $NotifierProvider<
    RequestFacilityFilterController, RequestFacilityFilterState> {
  RequestFacilityFilterControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'requestFacilityFilterControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$requestFacilityFilterControllerHash();

  @$internal
  @override
  RequestFacilityFilterController create() => RequestFacilityFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RequestFacilityFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RequestFacilityFilterState>(value),
    );
  }
}

String _$requestFacilityFilterControllerHash() =>
    r'79aed0d5dab005c0ae6ad1a4f6de8ea0c3435181';

abstract class _$RequestFacilityFilterController
    extends $Notifier<RequestFacilityFilterState> {
  RequestFacilityFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<RequestFacilityFilterState, RequestFacilityFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<RequestFacilityFilterState, RequestFacilityFilterState>,
        RequestFacilityFilterState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
