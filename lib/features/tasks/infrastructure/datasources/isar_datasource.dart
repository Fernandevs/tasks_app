import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tasks_app/features/tasks/domain/datasources/local_storage_datasource.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';

class IsarDatasource extends LocalStorageDatasource {
  late final Future<Isar> db;

  IsarDatasource() {
    db = _open();
  }

  Future<Isar> _open() async {
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
  Future<List<Task>> loadTasks({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.tasks.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<Task?> getTask(int id) async {
    final isar = await db;

    final Task? task = await isar.tasks.filter().idEqualTo(id).findFirst();

    return task;
  }

  @override
  Future<bool> isDone(int id) async {
    final isar = await db;

    final Task? isDone =
    await isar.tasks.filter().idEqualTo(id).findFirst();

    return isDone != null;
  }

  @override
  Future<void> toggleDone(int id) async {
    final isar = await db;

    final task = await isar.tasks.filter().idEqualTo(id).findFirst();

    if (task != null) {
      isar.writeTxnSync(() => isar.tasks.deleteSync(task.id!));
      return;
    }

    isar.writeTxnSync(() => isar.tasks.putSync(task!));
  }
}
