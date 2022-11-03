import 'package:flutter/material.dart';
import 'package:hot_drop/Widgets/api.dart';
import 'package:hot_drop/Widgets/branddivider.dart';
import 'package:hot_drop/Widgets/prediction_widget.dart';
import 'package:hot_drop/api_helper/apicalls.dart';
import 'package:hot_drop/api_helper/request_methods.dart';
import 'package:hot_drop/colors/brand_colors.dart';
import 'package:hot_drop/datamodels/place_model.dart';
import 'package:hot_drop/dataproviders/appdata.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  var focusDestination = FocusNode();
  bool isFocused = false;
  List<PlacePrediction> destinationPrediction = [];
  void setFocus() {
    if (!isFocused) {
      FocusScope.of(context).requestFocus(focusDestination);
      isFocused = true;
    }
  }

  void searchPlace(String placeName) async {
    if (placeName.length > 1) {
      String url =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$apiKey&sessiontoken=123254251&components=country:ng";
      var response = await ApiCalls.getRequest(url);
      if (response == 'failed') {
        return;
      }
      if (response['status'] == "OK") {
        var predictions = response["predictions"];
        var thisList = (predictions as List)
            .map((e) => PlacePrediction.fromJson(e))
            .toList();

        setState(() {
          destinationPrediction = thisList;
        });
      }
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    String origin = Provider.of<AppData>(context).pickupAddress.placeName ?? "";
    originController.text = origin;
    setFocus();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                spreadRadius: 0.5,
                offset: Offset(
                  0.7,
                  0.7,
                ),
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 40, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Set Destination",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Image.asset("assets/images/pickicon.png",
                          height: 16, width: 18),
                      const SizedBox(width: 18),
                      Expanded(
                        child: TextField(
                          controller: originController,
                          decoration: InputDecoration(
                              hintText: "Pick a location",
                              contentPadding:
                                  const EdgeInsets.only(left: 8, right: 8),
                              filled: true,
                              fillColor: const Color(0xFFe1e5e8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset("assets/images/desticon.png",
                          height: 18, width: 18),
                      const SizedBox(width: 18),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            searchPlace(value);
                          },
                          focusNode: focusDestination,
                          controller: destinationController,
                          decoration: InputDecoration(
                              hintText: "Where to?",
                              contentPadding: const EdgeInsets.only(left: 10),
                              filled: true,
                              fillColor: const Color(0xFFe1e5e8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          (destinationPrediction.length > 0)
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return PredictionTile(
                      prediction: destinationPrediction[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      BrandDivider(),
                  itemCount: destinationPrediction.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                )
              : Container()
        ],
      ),
    );
  }
}
