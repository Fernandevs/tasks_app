import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tasks_app/features/shared/presentation/providers/color_scheme_seed_provider.dart';
import 'package:tasks_app/features/shared/presentation/widgets/custom_color_picker.dart';

import 'dark_mode_control.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(colorSchemeSeedProvider).value!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: color),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Task App', style: TextStyle(fontSize: 24)),
                Spacer(),
                Image(
                  image: AssetImage('assets/launcher_icon/tasks_app.png'),
                  width: 80,
                  height: 80,
                ),
              ],
            ),
          ),
          const ListTile(title: DarkModeControl()),
          const Divider(),
          ListTile(
            title: CustomColorPicker(
              color: color,
              onColorChange: ref
                  .read(colorSchemeSeedProvider.notifier)
                  .changeColor,
            ),
          ),
        ],
      ),
    );
  }
}
