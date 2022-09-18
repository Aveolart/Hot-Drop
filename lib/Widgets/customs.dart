// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
final TextEditingController newEmailController = TextEditingController();
//
//
//
//
//
//
//
//Name Field

final nameField = TextFormField(
  textInputAction: TextInputAction.next,
  validator: (value) {
    RegExp regex = RegExp(r'^.{3,}$');
    if (value!.isEmpty) {
      return ("Name must be provided");
    }
    if (!regex.hasMatch(value)) {
      return ("Name is min. of 3 letters");
    }
    return null;
  },
  keyboardType: TextInputType.name,
  controller: nameController,
  // onSaved: (value) {
  //   nameController.text = value!;
  // },
  decoration: InputDecoration(
    labelText: "Full name",
    labelStyle: const TextStyle(
      fontSize: 14,
    ),
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 10,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  style: const TextStyle(fontSize: 14),
);
//
//
//
//
//
// Email Field

final emailField = TextFormField(
  onSaved: (value) {
    emailController.text = value!;
  },
  autofocus: false,
  autovalidateMode: AutovalidateMode.onUserInteraction,
  cursorHeight: 25,
  enableSuggestions: true,
  textAlignVertical: TextAlignVertical.bottom,
  controller: emailController,
  validator: (value) {
    if (value!.isEmpty) {
      return ("Please enter your email");
    }
    // Reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please enter a valid Email");
    }
    return null;
  },
  textInputAction: TextInputAction.next,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    labelText: "Email Address",
    labelStyle: TextStyle(
      fontSize: 14,
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 10,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  style: TextStyle(fontSize: 14),
);
//
//
//
//
//
//
//
//PhoneField

final phoneNumberField = TextFormField(
  controller: phoneController,
  keyboardType: TextInputType.phone,
  textInputAction: TextInputAction.next,
  validator: (value) {
    if (value!.isEmpty) {
      return ("Name must be provided");
    }
    if (!RegExp(r'^.{9,}$').hasMatch(value)) {
      return ("Phone number is min. of 9 letters");
    }
    return null;
  },
  // onSaved: (value) {
  //   phoneController.text = value!;
  // },
  decoration: InputDecoration(
    labelText: "Phone number",
    labelStyle: TextStyle(
      fontSize: 14,
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 10,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  style: TextStyle(fontSize: 14),
);
//
//
//
//
//
//
//

//PasswordField

final passwordField = TextFormField(
  controller: passwordController,
  textInputAction: TextInputAction.done,
  validator: (value) {
    if (value!.isEmpty) {
      return ("Please enter your password");
    }
    // Reg expression for email validation
    if (!RegExp(r'^.{6,}$').hasMatch(value)) {
      return ("Please enter a valid password");
    }
    return null;
  },
  onSaved: (value) {
    passwordController.text = value!;
  },
  obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    labelText: "Password",
    labelStyle: TextStyle(
      fontSize: 14,
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 10,
    ),
  ),
  style: TextStyle(fontSize: 14),
);
//
//
//
//
//
//
//New field

// NEw Passwordfields

final newPasswordField = TextFormField(
  controller: newPasswordController,
  textInputAction: TextInputAction.done,
  validator: (value) {
    if (value!.isEmpty) {
      return ("Please enter your password");
    }
    // Reg expression for email validation
    if (!RegExp(r'^.{6,}$').hasMatch(value)) {
      return ("Please enter a valid password");
    }
    return null;
  },
  // onSaved: (value) {
  //   newPasswordController.text = value!;
  // },
  obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    labelText: "Password",
    labelStyle: TextStyle(
      fontSize: 14,
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 10,
    ),
  ),
  style: TextStyle(fontSize: 14),
);
//
//
//
//
//
//
//
// Email Field

final newEmailField = TextFormField(
  // onSaved: (value) {
  //   newEmailController.text = value!;
  // },
  autofocus: false,
  controller: newEmailController,
  validator: (value) {
    if (value!.isEmpty) {
      return ("Please enter your email");
    }
    // Reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please enter a valid Email");
    }
    return null;
  },
  textInputAction: TextInputAction.next,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    labelText: "Email Address",
    labelStyle: TextStyle(
      fontSize: 14,
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 10,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  style: TextStyle(fontSize: 14),
);
