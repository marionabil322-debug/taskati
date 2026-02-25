import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/screens/add_tast_screen.dart';
import 'package:taskati/widgets/app_bottom.dart';
import 'package:taskati/widgets/app_string.dart';
import 'package:taskati/widgets/date_and_add_task.dart';
import 'package:taskati/widgets/day_item.dart';
import 'package:taskati/widgets/home_app_bar.dart';
import 'package:taskati/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  final XFile? photo;

  const HomeScreen({super.key, this.name, this.photo});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> statusList = ['All', 'TODO', 'Complete'];
  int currentActiveIndex = 0;
  int selectedDay = 0;
  UserModel? user;

  @override
  void initState() {
    super.initState();
    var box = Hive.box<UserModel>('user');
    if (box.isNotEmpty) {
      user = box.getAt(0);
    }
  }

  List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    if (currentActiveIndex == 0) {
      tasks = Hive.box<TaskModel>(AppString.tasksBox).values.toList();
      setState(() {});
    } else if (currentActiveIndex == 1) {
      tasks = Hive.box<TaskModel>(AppString.tasksBox).values
          .toList()
          .where((e) => e.statusTaxt.toLowerCase() == 'todo')
          .toList();
      setState(() {});
    } else {
      tasks = Hive.box<TaskModel>(AppString.tasksBox).values
          .toList()
          .where((e) => e.statusTaxt.toLowerCase() == 'complete')
          .toList();
      setState(() {});
    }
    if (user == null) {
      return Scaffold(body: Center(child: Text("No user found")));
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: ListView(
            children: [
              HomeAppBar(user: user!),
              SizedBox(height: 15),
              DateAndAddTask(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTastScreen()),
                  );
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              Row(
                children: List.generate(
                  statusList.length,
                  (index) => DayItem(
                    statusText: statusList[index],
                    isSelected: currentActiveIndex == index,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsetsGeometry.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppBottom(title: 'Delete All', onPressed: () {}),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );

                      setState(() {
                        currentActiveIndex = index;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),

              Visibility(
                visible: tasks.isEmpty,
                replacement: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => TaskCard(
                    task: tasks[index],
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        deletTask(index);
                      }
                      updateTaskStatus(index);
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: tasks.length,
                ),
                child: Lottie.asset(
                  'assets/images/empy list.json',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var myBox = Hive.box<TaskModel>(AppString.tasksBox);
  void deletTask(int index) {
    myBox.deleteAt(index);
    setState(() {});
  }

  updateTaskStatus(int index) {
    if (index < myBox.length) {
      TaskModel? updateTask = myBox.getAt(index);

      if (updateTask != null) {
        updateTask.statusTaxt = 'Complete';
        updateTask.save();
        setState(() {});
      }
    }
  }
}
