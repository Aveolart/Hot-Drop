// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TaxiElevatedButton extends StatelessWidget {
  final String text;
  final Color color;

  final VoidCallback onPressed;

  TaxiElevatedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        animationDuration: Duration(seconds: 10),
        primary: color,
        onPrimary: Colors.white,
        onSurface: Color(0xFFBDBDBD),
        padding: EdgeInsets.all(10),
        shadowColor: Colors.deepOrange[100],
        elevation: 10,
        // side: BorderSide(
        //   style: BorderStyle.solid,
        //   color: Colors.black,
        // ),
        minimumSize: Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'boltSemiBold',
          ),
        ),
      ),
    );
  }
}
