import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/taskati.dart';
import 'package:taskati/widgets/app_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<UserModel>(AppString.userBox);
  await Hive.openBox<TaskModel>(AppString.tasksBox);

  runApp(Taskati());
}
