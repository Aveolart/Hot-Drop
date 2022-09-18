// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, must_be_immutable, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hot_drop/Widgets/customs.dart';
import 'package:hot_drop/colors/brand_colors.dart';
import 'package:hot_drop/screens/mainpage.dart';
import 'package:hot_drop/screens/progressDialog.dart';
import 'package:hot_drop/screens/registrationpage.dart';
import 'package:hot_drop/widgets/taxibutton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  static String id = "Login In";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

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
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Sign In as a rider",
                        style: TextStyle(
                          fontFamily: "boltSemiBold",
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      emailField,
                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: 35),
                      TaxiElevatedButton(
                        color: BrandColors.colorGreen,
                        text: 'Login',
                        onPressed: () async {
                          var internet =
                              await (Connectivity().checkConnectivity());
                          if (internet != ConnectivityResult.mobile &&
                              internet != ConnectivityResult.wifi) {
                            Fluttertoast.showToast(
                                msg: "No internet Connection");
                          } else {
                            signIn(
                                emailController.text, passwordController.text);
                          }
                          // Navigator.pushNamed(context, RegistrationPage.id);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => RegistrationPage(),
                          //   ),
                          // );
                        },
                      ),
                      SizedBox(height: 25),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                          // Navigator.push(context, MaterialPageRoute(builder: context{

                          // }))
                        },
                        child: Text(
                          "Dont have an Account? Sign up here",
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

//  Login to site
  ///
  ///
  Future<void> signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(status: "Please wait"),
      );
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Fluttertoast.showToast(
                  msg: "Login Successful",
                  toastLength: Toast.LENGTH_LONG,
                ),
                Navigator.pop(context),
                Navigator.pushNamed(context, Homepage.id)
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
        Navigator.pop(context);
      });
    }
  }
}
