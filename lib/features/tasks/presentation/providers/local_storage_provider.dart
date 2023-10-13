import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app/features/tasks/infrastructure/datasources/isar_datasource.dart';
import 'package:tasks_app/features/tasks/infrastructure/repositories/local_storage_repository_impl.dart';

part 'local_storage_provider.g.dart';

@Riverpod(keepAlive: true)
LocalStorageRepositoryImpl localStorageRepository(
  LocalStorageRepositoryRef ref,
) => LocalStorageRepositoryImpl(IsarDatasource());
