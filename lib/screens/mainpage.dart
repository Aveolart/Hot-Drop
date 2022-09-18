// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, sized_box_for_whitespace, unnecessary_new, prefer_final_fields

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hot_drop/Widgets/branddivider.dart';
import 'package:hot_drop/Widgets/customwidgets.dart';

class Homepage extends StatefulWidget {
  static String id = "Mainpage";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  double searchSheetHeight = (Platform.isAndroid) ? 295 : 320;
  final Completer<GoogleMapController> _controller = Completer();

  late GoogleMapController mapController;

  double mapPadding = 0;

  var geolocator = Geolocator();
  late Position currentPosition;

  void positionLocator() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    currentPosition = position;

    LatLng posi = LatLng(position.latitude, position.longitude);
    CameraPosition cp = new CameraPosition(target: posi, zoom: 13);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: NavDrawers(),
        body: Stack(
          children: [
            GoogleMap(
              compassEnabled: true,
              padding: EdgeInsets.only(bottom: mapPadding),
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                mapController = controller;

                setState(() {
                  mapPadding = (Platform.isAndroid) ? 295 : 320;
                });

                positionLocator();
              },
            ),

            /// Drawer
            Positioned(
              top: 15,
              left: 15,
              child: GestureDetector(
                onTap: (() {
                  _globalKey.currentState!.openDrawer();
                }),
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.8),
                        ),
                      ]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Icon(
                      Icons.menu,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),

            /// Search
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: searchSheetHeight,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 0.5,
                      offset: Offset(0.5, 0.5),
                      blurRadius: 15,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nice to See you",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Where are you going?",
                        style:
                            TextStyle(fontFamily: "boltSemiBold", fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Seach Destination"),
                              Container()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      HomeWidget(),
                      BrandDivider(),
                      Workwidget()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> logout(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  // }
}
