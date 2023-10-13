import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app/features/tasks/presentation/providers/key_value_storage_provider.dart';

part 'color_scheme_seed_provider.g.dart';

@riverpod
class ColorSchemeSeed extends _$ColorSchemeSeed {
  @override
  FutureOr<Color> build() async =>
    Color(await ref
        .watch(keyValueStorageServiceProvider)
        .getValue<int>('color') ??
        Colors.amber.value);

  changeColor(Color color) {
    ref
        .watch(keyValueStorageServiceProvider)
        .setKeyValue('color', color.value);

    state = AsyncValue.data(color);
  }
}