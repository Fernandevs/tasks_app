import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id? id;
  String title;
  String description;
  bool isDone;
  int color;
  Image? image;

  Task({
    required this.color,
    required this.description,
    required this.title,
    this.isDone = false,
  });
}

@embedded
class Image {
  String? name;
  String? type;
}
