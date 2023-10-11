import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tasks_app/features/tasks/domain/datasources/local_storage_datasource.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';

class IsarDatasource extends LocalStorageDatasource {
  late final Future<Isar> db;

  IsarDatasource() {
    db = open();
  }

  Future<Isar> open() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [TaskSchema],
        inspector: true,
        directory: directory.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isDone(int taskId) async {
    final isar = await db;

    final Task? isFavoriteMovie =
        await isar.tasks.filter().idEqualTo(taskId).findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<void> toggleDone(Task task) async {
    final isar = await db;

    final pendingTask =
        await isar.tasks.filter().idEqualTo(task.id).findFirst();

    if (pendingTask != null) {
      isar.writeTxnSync(() => isar.tasks.deleteSync(pendingTask.id!));
      return;
    }

    isar.writeTxnSync(() => isar.tasks.putSync(task));
  }

  @override
  Future<List<Task>> loadTasks({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.tasks.where().offset(offset).limit(limit).findAll();
  }
}
