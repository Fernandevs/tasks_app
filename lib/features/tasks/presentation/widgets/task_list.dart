import 'package:flutter/cupertino.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';
import 'package:tasks_app/features/tasks/presentation/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  final VoidCallback? loadNextPage;

  const TaskList({super.key, required this.tasks, this.loadNextPage});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 100) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          final task = widget.tasks[index];

          return TaskTile(task: task);
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
