import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/screens/home_screen.dart';
import 'package:taskati/widgets/app_bottom.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  String? name;
  void pickImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: photo == null,
              replacement: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                backgroundImage: Image.file(File(photo?.path ?? "")).image,
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: Icon(Icons.person, size: 150, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            AppBottom(
              title: 'Upload From Camera',
              onPressed: () {
                pickImageFromCamera();
              },
            ),

            SizedBox(height: 15),
            AppBottom(
              title: 'Upload From Gallery',
              onPressed: () {
                pickImageFromGallery();
              },
            ),
            SizedBox(height: 50),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade300, width: 2),
              ),
              child: TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 100),
            AppBottom(
              title: 'Create account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(name: name, photo: photo),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
