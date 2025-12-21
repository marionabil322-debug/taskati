import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/widgets/day_item.dart';
import 'package:taskati/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  final XFile? photo;
  const HomeScreen({super.key, this.name, this.photo});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDay = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello ${widget.name ?? ''}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 132, 14, 211),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Have A Nice Day.',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  if (widget.photo != null)
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(File(widget.photo!.path)),
                    ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Des ,21 ,2025',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text(
                      'Add Task',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 100, 8, 221),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DayItem(
                      dayName: 'DES',
                      dayNumber: '21',
                      dayShort: 'SUN',
                      isSelected: selectedDay == 0,
                      onTap: () {
                        setState(() {
                          selectedDay = 0;
                        });
                      },
                    ),
                    SizedBox(width: 12),
                    DayItem(
                      dayName: 'DES',
                      dayNumber: '22',
                      dayShort: 'MON',
                      isSelected: selectedDay == 1,
                      onTap: () {
                        setState(() {
                          selectedDay = 1;
                        });
                      },
                    ),
                    SizedBox(width: 12),
                    DayItem(
                      dayName: 'DES',
                      dayNumber: '23',
                      dayShort: 'TUE',
                      isSelected: selectedDay == 2,
                      onTap: () {
                        setState(() {
                          selectedDay = 2;
                        });
                      },
                    ),
                    SizedBox(width: 12),
                    DayItem(
                      dayName: 'DES',
                      dayNumber: '24',
                      dayShort: 'WED',
                      isSelected: selectedDay == 3,
                      onTap: () {
                        setState(() {
                          selectedDay = 3;
                        });
                      },
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: [
                    TaskCard(
                      color: Colors.green,
                      title: 'Flutter Task - 1',
                      time: '02:25AM-02:40',
                      description: 'I will do This Task',
                    ),
                    SizedBox(height: 24),
                    TaskCard(
                      color: Colors.red,
                      title: 'Flutter Task - 2',
                      time: '04:25AM-04:40',
                      description: 'I will do This Task',
                    ),
                    SizedBox(height: 24),
                    TaskCard(
                      color: Colors.orange,
                      title: 'Flutter Task - 3',
                      time: '06:25AM-06:40',
                      description: 'I will do This Task',
                    ),
                    SizedBox(height: 24),
                    TaskCard(
                      color: Colors.black,
                      title: 'Flutter Task - 4',
                      time: '08:25AM-08:40',
                      description: 'I will do This Task',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
