// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors
// @dart=2.9

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hot_drop/dataproviders/appdata.dart';
import 'package:hot_drop/screens/loginpage.dart';
import 'package:hot_drop/screens/mainpage.dart';
import 'package:hot_drop/screens/progressdialog.dart';
import 'package:hot_drop/screens/registrationpage.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:hot_drop/screens/testscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'db2',
    options: FirebaseOptions(
      databaseURL: "https://hotdrop-5f134-default-rtdb.firebaseio.com",
      appId: "1:806499409143:android:8295729db7f7ed820a47f2",
      apiKey: "AIzaSyBv3aPHCGWaBLa0qHUQehi3zGtAGeffv-I",
      projectId: 'hotdrop-5f134',
      messagingSenderId: '806499409143',
    ),
  );

  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'boltRegular',
        ),
        initialRoute: Homepage.id,
        routes: {
          MyWidget.id: (context) => MyWidget(),
          RegistrationPage.id: (context) => RegistrationPage(),
          LoginPage.id: (context) => LoginPage(),
          Homepage.id: (context) => Homepage(),
        },
      ),
    );
  }
}
