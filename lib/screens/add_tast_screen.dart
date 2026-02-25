import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati/models/task_model.dart';
import 'package:taskati/widgets/add_text_form_field.dart';
import 'package:taskati/widgets/app_bottom.dart';
import 'package:taskati/widgets/app_string.dart';

class AddTastScreen extends StatefulWidget {
  const AddTastScreen({super.key});

  @override
  State<AddTastScreen> createState() => _AddTastScreenState();
}

class _AddTastScreenState extends State<AddTastScreen> {
  var formkey = GlobalKey<FormState>();
  List<MaterialColor> taskColors = [
    Colors.red,
    Colors.deepPurple,
    Colors.blue,
    Colors.yellow,
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  int activeColorIndex = -1;
  TimeOfDay? starTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple),
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
        title: Text('Add Tast'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Titel',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                AddTextFormField(
                  controller: titleController,

                  hintText: "Enter Tesk Tital",
                ),
                SizedBox(height: 10),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                AddTextFormField(
                  controller: descController,

                  hintText: "Enter Tesk Discription",
                  maxline: 3,
                ),
                SizedBox(height: 10),
                Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                AddTextFormField(
                  controller: dateController,
                  hintText: "17/2/2025",
                  suffixIcon: Icon(Icons.date_range),
                  readonly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2027),
                      barrierColor: Color.fromARGB(3, 4, 3, 100),
                    ).then((value) {
                      dateController.text = DateFormat.yMd()
                          .format(value ?? DateTime.now())
                          .toString();
                    });
                  },
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),

                          AddTextFormField(
                            controller: startTimeController,
                            hintText: "09:08 PM",
                            suffixIcon: Icon(Icons.alarm),
                            readonly: true,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                starTime = value;
                                startTimeController.text =
                                    value?.format(context) ?? "";
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12, width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End Time',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),

                          AddTextFormField(
                            controller: endTimeController,
                            hintText: "09:08 PM",
                            validator: (v) {
                              if (starTime != null) {
                                if (endTime?.isBefore(starTime!) ?? false) {
                                  return 'End Time cannot be before Start Time';
                                }
                              }
                            },
                            suffixIcon: Icon(Icons.alarm),
                            readonly: true,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                endTime = value;

                                endTimeController.text =
                                    value?.format(context) ?? "";
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: List.generate(
                    taskColors.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          activeColorIndex = index;
                        });
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: taskColors[index],
                        child: activeColorIndex == index
                            ? Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                AppBottom(
                  title: 'Create Task',
                  onPressed: () {
                    if ((formkey.currentState?.validate() ?? false)) {
                      if (activeColorIndex == -1) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(' Bro select color'),
                            content: Text(
                              ' متتعبناش ماشيين بعلاج',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        return;
                      }

                      Hive.box<TaskModel>(AppString.tasksBox)
                          .add(
                            TaskModel(
                              taskTitle: titleController.text,
                              date: dateController.text,
                              startTime: startTimeController.text,
                              endTime: endTimeController.text,
                              description: descController.text,
                              statusTaxt: 'TODO',
                              color: taskColors[activeColorIndex].toARGB32(),
                            ),
                          )
                          .then((v) {
                            Navigator.pop(context);
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
