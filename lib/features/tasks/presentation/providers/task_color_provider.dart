import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_color_provider.g.dart';

@Riverpod(keepAlive: true)
class TaskColor extends _$TaskColor {
  @override
  Color build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    return color;
  }

  void changeColor(Color color) => state = color;
}
