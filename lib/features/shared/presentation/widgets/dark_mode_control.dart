import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app/features/shared/presentation/providers/dark_mode_provider.dart';

class DarkModeControl extends ConsumerWidget {
  const DarkModeControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Modo oscuro'),
        const Spacer(),
        Icon(!isDarkMode.value! ? Icons.nightlight : Icons.sunny),
        Switch.adaptive(
          value: isDarkMode.value!,
          onChanged: (value) => ref
              .read(darkModeProvider.notifier)
              .toggleDarkMode(),
        ),
      ],
    );
  }
}
