// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authProviders)
final authProvidersProvider = AuthProvidersProvider._();

final class AuthProvidersProvider extends $FunctionalProvider<
        List<AuthProvider<AuthListener, AuthCredential>>,
        List<AuthProvider<AuthListener, AuthCredential>>,
        List<AuthProvider<AuthListener, AuthCredential>>>
    with $Provider<List<AuthProvider<AuthListener, AuthCredential>>> {
  AuthProvidersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authProvidersProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authProvidersHash();

  @$internal
  @override
  $ProviderElement<List<AuthProvider<AuthListener, AuthCredential>>>
      $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  List<AuthProvider<AuthListener, AuthCredential>> create(Ref ref) {
    return authProviders(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
      List<AuthProvider<AuthListener, AuthCredential>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<List<AuthProvider<AuthListener, AuthCredential>>>(
              value),
    );
  }
}

String _$authProvidersHash() => r'8a83535c31539dac72f21c3f27b7d7fb77161e5f';
