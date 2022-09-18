// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hot_drop/Widgets/branddivider.dart';
import 'package:hot_drop/Widgets/styles.dart';
import 'package:hot_drop/colors/brand_colors.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            OMIcons.home,
            size: 25,
            color: BrandColors.colorDimText,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Add home address",
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Workwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(
            OMIcons.workOutline,
            size: 25,
            color: BrandColors.colorDimText,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Work",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Add work address",
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

class NavDrawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      color: Colors.white,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Container(
              color: Colors.white,
              height: 160,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/user_icon.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abiola",
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'boltSemiBold'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "View profile",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            BrandDivider(),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(OMIcons.cardGiftcard),
              title: Text(
                "Free rides",
                style: kDrawerItemStyle,
              ),
            ),
            ListTile(
              leading: Icon(OMIcons.creditCard),
              title: Text(
                "Payments",
                style: kDrawerItemStyle,
              ),
            ),
            ListTile(
              leading: Icon(OMIcons.history),
              title: Text(
                "Ride History",
                style: kDrawerItemStyle,
              ),
            ),
            ListTile(
              leading: Icon(OMIcons.contactSupport),
              title: Text(
                "Support",
                style: kDrawerItemStyle,
              ),
            ),
            ListTile(
              leading: Icon(OMIcons.info),
              title: Text(
                "About",
                style: kDrawerItemStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
