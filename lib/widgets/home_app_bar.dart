import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/screens/auth_screen.dart';
import 'package:taskati/widgets/app_string.dart';

class HomeAppBar extends StatelessWidget {
  final UserModel user;
  const HomeAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ${user?.name ?? ""}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 132, 14, 211),
              ),
            ),
            SizedBox(height: 5),
            Text('Have A Nice Day.', style: TextStyle(fontSize: 14)),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 30,
          // ignore: dead_code
          backgroundImage: Image.file(File(user?.image ?? "")).image,
        ),
        IconButton(
          onPressed: () {
            Hive.box<UserModel>(AppString.userBox).clear();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AuthScreen()),
              (r) => false,
            );
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }
}
