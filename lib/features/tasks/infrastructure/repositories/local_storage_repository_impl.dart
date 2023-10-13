import 'package:tasks_app/features/tasks/domain/datasources/local_storage_datasource.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';
import 'package:tasks_app/features/tasks/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource _datasource;

  LocalStorageRepositoryImpl(this._datasource);

  @override
  Future<List<Task>> loadTasks({int limit = 10, int offset = 0}) =>
      _datasource.loadTasks(limit: limit, offset: offset);

  @override
  Future<Task?> getTask(int id) => _datasource.getTask(id);

  @override
  Future<void> toggleDone(int id) => _datasource.toggleDone(id);

  @override
  Future<bool> isDone(int id) => _datasource.isDone(id);
}
