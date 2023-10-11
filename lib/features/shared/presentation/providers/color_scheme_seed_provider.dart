import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_scheme_seed_provider.g.dart';

@riverpod
class ColorSchemeSeed extends _$ColorSchemeSeed {
  @override
  Color build() => Colors.blue;

  void changeColor(Color color) => state = color;
}
