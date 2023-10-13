import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/features/tasks/presentation/screens/create_or_update_task_screen.dart';

import 'package:tasks_app/features/tasks/presentation/screens/home_screen.dart';
import 'package:tasks_app/features/tasks/presentation/screens/task_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'task:id',
            name: TaskScreen.name,
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id'] ?? '0');

              return TaskScreen(id: id);
            },
          ),
          GoRoute(
            path: 'create_or_update',
            name: CreateOrUpdateTaskScreen.name,
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id'] ?? '0');

              return CreateOrUpdateTaskScreen(id: id);
            },
          ),
        ],
      ),
    ],
  );
}
