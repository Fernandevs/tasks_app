import 'package:tasks_app/features/tasks/domain/entities/task.dart';

abstract class LocalStorageRepository {
  Future<void> toggleDone(Task task);

  Future<bool> isDone(int taskId);

  Future<List<Task>> loadTasks({int limit = 10, int offset = 0});
}
