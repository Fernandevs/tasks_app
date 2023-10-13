import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/features/shared/presentation/widgets/custom_drawer.dart';
import 'package:tasks_app/features/tasks/presentation/screens/create_or_update_task_screen.dart';
import 'package:tasks_app/features/tasks/presentation/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tasks App'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.pending_outlined)),
              Tab(icon: Icon(Icons.task_alt_outlined)),
              Tab(icon: Icon(Icons.list_outlined)),
            ],
          ),
        ),
        body: const TaskList(tasks: []),
        drawer: const CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.goNamed(CreateOrUpdateTaskScreen.name),
        ),
      ),
    );
  }
}
