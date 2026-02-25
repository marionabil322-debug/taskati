import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String taskTitle;
  @HiveField(1)
  String date;
  @HiveField(2)
  String startTime;
  @HiveField(3)
  String endTime;
  @HiveField(4)
  String description;
  @HiveField(5)
  String statusTaxt;
  @HiveField(6)
  int color;

  TaskModel({
    required this.taskTitle,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.statusTaxt,
    required this.color,
  });
}
