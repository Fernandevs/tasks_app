import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app/features/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:tasks_app/features/shared/infrastructure/services/key_value_storage_service_impl.dart';

part 'key_value_storage_provider.g.dart';

@riverpod
KeyValueStorageService keyValueStorageService(KeyValueStorageServiceRef ref) =>
    KeyValueStorageServiceImpl();
