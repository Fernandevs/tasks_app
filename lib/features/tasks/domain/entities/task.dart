import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id? id;
  String title;
  String description;
  String char;
  DateTime? creationDate;
  DateTime? finishDate;
  bool isDone;
  int color;
  Image? image;

  Task({
    required this.color,
    required this.description,
    required this.title,
    this.isDone = false,
    this.char = '',
  });
}

@embedded
class Image {
  String? url;
  String? name;
  String? type;
}
