// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors
// @dart=2.9

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hot_drop/screens/loginpage.dart';
import 'package:hot_drop/screens/mainpage.dart';
import 'package:hot_drop/screens/progressdialog.dart';
import 'package:hot_drop/screens/registrationpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'boltRegular',
      ),
      initialRoute: LoginPage.id,
      routes: {
        RegistrationPage.id: (context) => RegistrationPage(),
        LoginPage.id: (context) => LoginPage(),
        Homepage.id: (context) => Homepage(),
      },
    );
  }
}
