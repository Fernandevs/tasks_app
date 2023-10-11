import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app/features/shared/presentation/widgets/custom_color_picker.dart';

import 'dark_mode_control.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).primaryColor;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: color),
            child: const Text('Drawer Header'),
          ),
          const ListTile(title: DarkModeControl()),
          const Divider(),
          const ListTile(title: CustomColorPicker()),
        ],
      ),
    );
  }
}
