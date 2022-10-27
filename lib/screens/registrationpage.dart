// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, prefer_const_constructors_in_immutables, deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hot_drop/Widgets/customs.dart';
import 'package:hot_drop/colors/brand_colors.dart';
import 'package:hot_drop/screens/mainpage.dart';
import 'package:hot_drop/screens/progressdialog.dart';
import 'package:hot_drop/services/userdata.dart';
import 'package:hot_drop/widgets/taxibutton.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  static String id = "Register";

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _auth = FirebaseAuth.instance;

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  final _formkey = GlobalKey<FormState>();

  //   void signUp(String email, String password) async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.colorBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 90),
              SizedBox(
                height: 120,
                width: 120,
                child: Image(
                  alignment: Alignment.center,
                  image: AssetImage(
                    "assets/images/logo.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Text(
                        "Create an account",
                        style: TextStyle(
                          fontFamily: "boltSemiBold",
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      //Full name
                      nameField,
                      SizedBox(height: 15),
                      //Email Address
                      newEmailField,
                      SizedBox(height: 15),
                      phoneNumberField,
                      SizedBox(height: 15),
                      //Password
                      newPasswordField,
                      SizedBox(height: 35),
                      TaxiElevatedButton(
                        text: "Sign Up",
                        color: BrandColors.colorGreen,
                        onPressed: () async {
                          var internet =
                              await (Connectivity().checkConnectivity());
                          if (internet != ConnectivityResult.mobile &&
                              internet != ConnectivityResult.wifi) {
                            Fluttertoast.showToast(
                                msg: "No internet Connection");
                                
                          } else {
                            signUp();
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Already have an account? Login here",
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    // final user = await _auth
    //     .createUserWithEmailAndPassword(email: email, password: password)
    //     .then((value) => sendToFirestore())
    //     .catchError((e) {
    //   Fluttertoast.showToast(msg: e!.message);
    // });

    if (_formkey.currentState!.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(status: "Please wait"),
      );
      final user = await _auth
          .createUserWithEmailAndPassword(
              email: newEmailController.text,
              password: newPasswordController.text)
          .catchError((ex) {
        PlatformException thisEx = ex;
        Fluttertoast.showToast(msg: thisEx.message.toString());
      });
      senddata(
          nameController.text, phoneController.text, newEmailController.text);

      Fluttertoast.showToast(
          msg: "Registration Complete",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      // Navigator.pop(context);
      Navigator.pushReplacementNamed(context, Homepage.id).catchError((e) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: e!.message);
      });

      // final UserCredential user = await (_auth.createUserWithEmailAndPassword(
      //     email: email, password: password));
    }
  }

  void senddata(String? name, String phone, String email) {
    String? key = ref.child("User").push().key;
    ref.child('User').push().set({
      "id": key,
      "name": name,
      "phone": phone,
      "email address": email,
      "password": newPasswordController.text
    });
    nameController.clear();
    newEmailController.clear();
    phoneController.clear();
    passwordController.clear();
  }
  // void senddata() async {
  //   databaseRef.child("hotdrop").push().set({
  //     'Name': nameController.text,
  //     'Phone Number': phoneController.text,
  //   });
  //   nameController.clear();
  //   newEmailController.clear();
  //   newPasswordController.clear();
  //   nameController.clear();
  // }

  // Sending data to firestore
  // sendToFirestore() async {
  //   // calling firestore    FirebaseUser
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;

  //   //calling model and Writing values
  //   UserModel userModel = UserModel();
  //   //writing values
  //   userModel.email = user!.email;
  //   userModel.uid = user.uid;
  //   userModel.phoneNumber = phoneController.text;
  //   userModel.firstname = nameController.text;

  //   // sending data
  //   await firebaseFirestore.collection("users").doc(user.uid).set(
  //         userModel.toMap(),
  //       );
  //   Fluttertoast.showToast(
  //           textColor: Colors.blue[400],
  //           msg: "Account created successfully",
  //           toastLength: Toast.LENGTH_LONG)
  //       .then((value) => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Homepage())));

  //   // sending data
}
