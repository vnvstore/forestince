// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SummaryController)
final summaryControllerProvider = SummaryControllerProvider._();

final class SummaryControllerProvider
    extends $AsyncNotifierProvider<SummaryController, SummaryModel> {
  SummaryControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'summaryControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$summaryControllerHash();

  @$internal
  @override
  SummaryController create() => SummaryController();
}

String _$summaryControllerHash() => r'd97ccc89e9a08d407fc30bd5f9e2212982b91ca2';

abstract class _$SummaryController extends $AsyncNotifier<SummaryModel> {
  FutureOr<SummaryModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SummaryModel>, SummaryModel>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SummaryModel>, SummaryModel>,
        AsyncValue<SummaryModel>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
