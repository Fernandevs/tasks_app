import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app/features/tasks/domain/entities/task.dart';

part 'task_image_provider.g.dart';

@riverpod
class TaskImage extends _$TaskImage {
  @override
  FutureOr<Image> build() async {
    return Image();
  }
}
