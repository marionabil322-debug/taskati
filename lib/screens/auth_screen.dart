import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/models/user_model.dart';
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

  TextEditingController nameController = TextEditingController();
  addUser() async {
    if (nameController.text.isNotEmpty) {
      var myBox = Hive.box<UserModel>('user');
      await myBox.clear();
      myBox
          .add(UserModel(image: photo?.path ?? "", name: nameController.text))
          .then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (c) =>
                    HomeScreen(name: nameController.text, photo: photo),
              ),
              (route) => false,
            );
          })
          .catchError((e) {
            print('Error $e');
          });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your name')));
    }
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
              child: TextFormField(
                controller: nameController,
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                },
                validator: (v) {
                  return null;
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
                if (photo == null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error!', textAlign: TextAlign.center),
                        content: Text(
                          'Image is required',
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );
                  return;
                }
                addUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
