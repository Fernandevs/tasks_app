import 'package:tasks_app/features/tasks/domain/datasources/local_storage_datasource.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';
import 'package:tasks_app/features/tasks/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isDone(int taskId) => datasource.isDone(taskId);

  @override
  Future<List<Task>> loadTasks({int limit = 10, int offset = 0}) =>
      datasource.loadTasks(limit: limit, offset: offset);

  @override
  Future<void> toggleDone(Task task) => datasource.toggleDone(task);
}
