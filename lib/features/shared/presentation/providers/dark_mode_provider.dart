import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app/features/tasks/presentation/providers/key_value_storage_provider.dart';

part 'dark_mode_provider.g.dart';

@riverpod
class DarkMode extends _$DarkMode {
  @override
  FutureOr<bool> build() async =>
      await ref
          .watch(keyValueStorageServiceProvider)
          .getValue<bool>('isDarkMode') ??
      false;

  toggleDarkMode() async {
    bool isDarkMode = state.value ?? false;
    isDarkMode = !isDarkMode;

    ref
        .watch(keyValueStorageServiceProvider)
        .setKeyValue('isDarkMode', isDarkMode);

    state = AsyncValue.data(isDarkMode);
  }
}
