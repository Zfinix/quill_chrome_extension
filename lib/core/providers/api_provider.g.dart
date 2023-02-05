// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$fetchQuillMessageHash() => r'83cf96853f9566a84146154c526818eea1d9c6c1';

/// See also [fetchQuillMessage].
class FetchQuillMessageProvider
    extends AutoDisposeFutureProvider<QuillBotModel> {
  FetchQuillMessageProvider({
    required this.message,
  }) : super(
          (ref) => fetchQuillMessage(
            ref,
            message: message,
          ),
          from: fetchQuillMessageProvider,
          name: r'fetchQuillMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchQuillMessageHash,
        );

  final String message;

  @override
  bool operator ==(Object other) {
    return other is FetchQuillMessageProvider && other.message == message;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchQuillMessageRef = AutoDisposeFutureProviderRef<QuillBotModel>;

/// See also [fetchQuillMessage].
final fetchQuillMessageProvider = FetchQuillMessageFamily();

class FetchQuillMessageFamily extends Family<AsyncValue<QuillBotModel>> {
  FetchQuillMessageFamily();

  FetchQuillMessageProvider call({
    required String message,
  }) {
    return FetchQuillMessageProvider(
      message: message,
    );
  }

  @override
  AutoDisposeFutureProvider<QuillBotModel> getProviderOverride(
    covariant FetchQuillMessageProvider provider,
  ) {
    return call(
      message: provider.message,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchQuillMessageProvider';
}
