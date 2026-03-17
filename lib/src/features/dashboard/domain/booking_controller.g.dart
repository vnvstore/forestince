// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookingController)
final bookingControllerProvider = BookingControllerProvider._();

final class BookingControllerProvider
    extends $AsyncNotifierProvider<BookingController, List<BookingModel>> {
  BookingControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bookingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookingControllerHash();

  @$internal
  @override
  BookingController create() => BookingController();
}

String _$bookingControllerHash() => r'fa28641c33bdec3405d2bf9ed2b93dc74f1043ef';

abstract class _$BookingController extends $AsyncNotifier<List<BookingModel>> {
  FutureOr<List<BookingModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<BookingModel>>, List<BookingModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<BookingModel>>, List<BookingModel>>,
        AsyncValue<List<BookingModel>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
