import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/screens/auth_screen.dart';
import 'package:taskati/screens/home_screen.dart';
import 'package:taskati/widgets/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/splash_screen.json"),
            Text(
              'Taskati',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              'It\'s Time To Get Organiaed',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  void nextScreen() {
    Future.delayed(Duration(seconds: 4), () {
      if (Hive.box<UserModel>(AppString.userBox).isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => AuthScreen()),
        );
      }
    });
  }
}
