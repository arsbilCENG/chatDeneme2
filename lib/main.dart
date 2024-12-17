import 'package:flutter/material.dart';
import 'package:pawsguard/screens/1createpet_screen.dart';
import 'package:pawsguard/screens/cat_foodselectionscreen.dart';
import 'package:pawsguard/screens/chatbot_screen.dart';
import 'package:pawsguard/screens/congratulation_screen.dart';
import 'package:pawsguard/screens/dog_foodselection.dart';
import 'package:pawsguard/screens/findpet_screen.dart';
import 'package:pawsguard/screens/healtissues_screen.dart';
import 'package:pawsguard/screens/home_screen.dart';
import 'package:pawsguard/screens/login_screen.dart';
import 'package:pawsguard/screens/petdetail_screen.dart';
import 'package:pawsguard/screens/sign_screen.dart';
import 'package:pawsguard/screens/splash_screen.dart';

void main() {
  runApp(const HomeScreen());
}

class PawsGuardApp extends StatelessWidget {
  const PawsGuardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PawsGuard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
