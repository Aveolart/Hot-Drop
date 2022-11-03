import 'package:flutter/material.dart';
import 'package:hot_drop/Widgets/api.dart';
import 'package:hot_drop/api_helper/apicalls.dart';
import 'package:hot_drop/colors/brand_colors.dart';
import 'package:hot_drop/datamodels/address.dart';
import 'package:hot_drop/datamodels/place_model.dart';
import 'package:hot_drop/dataproviders/appdata.dart';
import 'package:hot_drop/screens/progressdialog.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

class PredictionTile extends StatelessWidget {
  final PlacePrediction prediction;
  const PredictionTile({
    required this.prediction,
    Key? key,
  }) : super(key: key);
  void getPlaceDetails(String placeID, context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(status: "Please wait..."));
    String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$apiKey';
    var response = await ApiCalls.getRequest(url);
    Navigator.pop(context);
    if (response == 'failed') {
      return;
    }
    if (response['status'] == "OK") {
      Address thisPlace = Address();
      thisPlace.placeName = response['result']['name'];
      thisPlace.placeId = placeID;
      thisPlace.latitude = response['result']['geometry']['location']['lat'];
      thisPlace.longitude = response['result']['geometry']['location']['lng'];
      Provider.of<AppData>(context, listen: false)
          .updateDestinationAddress(thisPlace);
      print(thisPlace.placeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getPlaceDetails(prediction.placeId!, context);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Icon(OMIcons.locationOn, color: BrandColors.colorDimText),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(prediction.mainText ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 18)),
                  Text(prediction.secondaryText ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 14, color: BrandColors.colorDimText))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
