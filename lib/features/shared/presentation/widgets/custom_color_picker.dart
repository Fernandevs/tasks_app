import 'package:flutter/material.dart';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tasks_app/features/shared/presentation/providers/color_scheme_seed_provider.dart';

class CustomColorPicker extends ConsumerWidget {
  const CustomColorPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(colorSchemeSeedProvider);

    return ColorPicker(
      color: color,
      borderRadius: 20,
      heading: const Text('Elige un color'),
      onColorChanged: (color) => ref
          .read(colorSchemeSeedProvider.notifier)
          .changeColor(color),
    );
  }
}
