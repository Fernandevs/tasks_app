import 'package:tasks_app/features/tasks/domain/entities/task.dart';

abstract class LocalStorageRepository {
  Future<List<Task>> loadTasks({int limit = 10, int offset = 0});

  Future<Task?> getTask(int id);

  Future<void> toggleDone(int id);

  Future<bool> isDone(int id);
}
