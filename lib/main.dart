import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tasks_app/config/router/app_router.dart';
import 'package:tasks_app/features/tasks/presentation/providers/providers.dart';

void main() => runApp(const ProviderScope(child: TasksApp()));

class TasksApp extends ConsumerWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final isDarkMode = ref.watch(darkModeProvider).value ?? false;
    final colorSchemeSeed = ref.watch(colorSchemeSeedProvider).value;

    return MaterialApp.router(
      title: 'Tasks App',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorSchemeSeed,
      ),
    );
  }
}
