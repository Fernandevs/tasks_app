// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskColorHash() => r'9ba9cff09024c0e43616ea1bb4af6b241e26ad3b';

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

abstract class _$TaskColor extends BuildlessNotifier<Color> {
  late final BuildContext context;

  Color build(
    BuildContext context,
  );
}

/// See also [TaskColor].
@ProviderFor(TaskColor)
const taskColorProvider = TaskColorFamily();

/// See also [TaskColor].
class TaskColorFamily extends Family<Color> {
  /// See also [TaskColor].
  const TaskColorFamily();

  /// See also [TaskColor].
  TaskColorProvider call(
    BuildContext context,
  ) {
    return TaskColorProvider(
      context,
    );
  }

  @override
  TaskColorProvider getProviderOverride(
    covariant TaskColorProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'taskColorProvider';
}

/// See also [TaskColor].
class TaskColorProvider extends NotifierProviderImpl<TaskColor, Color> {
  /// See also [TaskColor].
  TaskColorProvider(
    BuildContext context,
  ) : this._internal(
          () => TaskColor()..context = context,
          from: taskColorProvider,
          name: r'taskColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskColorHash,
          dependencies: TaskColorFamily._dependencies,
          allTransitiveDependencies: TaskColorFamily._allTransitiveDependencies,
          context: context,
        );

  TaskColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Color runNotifierBuild(
    covariant TaskColor notifier,
  ) {
    return notifier.build(
      context,
    );
  }

  @override
  Override overrideWith(TaskColor Function() create) {
    return ProviderOverride(
      origin: this,
      override: TaskColorProvider._internal(
        () => create()..context = context,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  NotifierProviderElement<TaskColor, Color> createElement() {
    return _TaskColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskColorProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TaskColorRef on NotifierProviderRef<Color> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _TaskColorProviderElement
    extends NotifierProviderElement<TaskColor, Color> with TaskColorRef {
  _TaskColorProviderElement(super.provider);

  @override
  BuildContext get context => (origin as TaskColorProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
