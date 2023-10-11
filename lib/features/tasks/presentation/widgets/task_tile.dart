import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1.0,
              color: Colors.white24,
            ),
          ),
        ),
        child: const Icon(
          Icons.autorenew,
          color: Colors.white,
        ),
      ),
      title: Text(
        task.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      ),
      onTap: () {},
    );
  }
}
