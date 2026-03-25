// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_facility_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(requestFacilityController)
final requestFacilityControllerProvider = RequestFacilityControllerProvider._();

final class RequestFacilityControllerProvider extends $FunctionalProvider<
        AsyncValue<List<RequestFacilityModel>>,
        List<RequestFacilityModel>,
        FutureOr<List<RequestFacilityModel>>>
    with
        $FutureModifier<List<RequestFacilityModel>>,
        $FutureProvider<List<RequestFacilityModel>> {
  RequestFacilityControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'requestFacilityControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$requestFacilityControllerHash();

  @$internal
  @override
  $FutureProviderElement<List<RequestFacilityModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<RequestFacilityModel>> create(Ref ref) {
    return requestFacilityController(ref);
  }
}

String _$requestFacilityControllerHash() =>
    r'd8a8ce0a349dfb8c384a2d8a7757f80db3e10e5c';
