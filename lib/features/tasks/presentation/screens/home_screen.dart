import 'package:flutter/material.dart';
import 'package:tasks_app/features/shared/presentation/widgets/custom_drawer.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';
import 'package:tasks_app/features/tasks/presentation/widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tasks App'),
      ),
      body: Center(
        child: TaskTile(
          task: Task(
            color: Colors.amber.value,
            description: 'Mundo',
            title: 'Hola',
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
