import 'package:flutter/material.dart';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tasks_app/features/shared/presentation/providers/color_scheme_seed_provider.dart';

typedef OnColorChange = void Function(Color color);

class CustomColorPicker extends StatelessWidget {
  final Color color;
  final OnColorChange onColorChange;

  const CustomColorPicker({
    super.key,
    required this.color,
    required this.onColorChange,
  });

  @override
  Widget build(BuildContext context) {
    return ColorPicker(
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.accent: false,
        ColorPickerType.both: false,
      },
      color: color,
      width: 30,
      height: 30,
      borderRadius: 20,
      spacing: 10,
      heading: const Text('Elige un color'),
      onColorChanged: onColorChange,
      // (color) => ref.read(colorSchemeSeedProvider.notifier).changeColor(color),
    );
  }
}
