import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  static String id = "testing";

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            DatabaseReference dref =
                FirebaseDatabase.instance.ref().child("New");
            dref.push().set({
              "Test 1": "Is connected",
              "Current Date and time": dateTime.toString(),
            });
          },
          child: const Text("Test connection"),
        ),
      ),
    );
  }
}
