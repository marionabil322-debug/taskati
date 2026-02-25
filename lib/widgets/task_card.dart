import 'package:flutter/material.dart';
import 'package:taskati/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final void Function(DismissDirection)? onDismissed;
  const TaskCard({super.key, required this.task, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        height: 100,
        color: Colors.red,
        child: Icon(Icons.delete),
      ),
      secondaryBackground: Container(
        height: 100,
        color: Colors.green,
        child: Icon(Icons.incomplete_circle, color: Colors.white),
      ),
      onDismissed: onDismissed,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        height: 130,
        decoration: BoxDecoration(
          color: Color(task.color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    task.taskTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 16),
                          Text(
                            task.date,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${task.startTime} - ${task.endTime}',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 18),
                        ],
                      ),
                      Text(
                        task.description,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 80, width: 1, color: Colors.white70),
            SizedBox(width: 12),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.statusTaxt,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
