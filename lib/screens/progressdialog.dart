// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hot_drop/colors/brand_colors.dart';

class ProgressDialog extends StatelessWidget {
  ProgressDialog({required this.status});

  static String id = "Progress";

  final String status;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            SizedBox(width: 5),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                BrandColors.colorAccent,
              ),
            ),
            
            SizedBox(width: 25),
            Text(
              status,
              style: TextStyle(fontSize: 15),
            )
          ]),
        ),
      ),
    );
  }
}
