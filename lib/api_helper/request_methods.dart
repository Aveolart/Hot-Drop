import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hot_drop/Widgets/api.dart';
import 'package:hot_drop/api_helper/apicalls.dart';
import 'package:hot_drop/datamodels/address.dart';
import 'package:hot_drop/datamodels/directions_model.dart';
import 'package:hot_drop/dataproviders/appdata.dart';
import 'package:provider/provider.dart';

class RequestMethods {
  static Future<dynamic> findCoordinateAddress(
      Position position, context) async {
    String address = '';
    var activeInternet = await Connectivity().checkConnectivity();
    if (activeInternet != ConnectivityResult.mobile &&
        activeInternet != ConnectivityResult.wifi) {
      return address;
    }

    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey';
    var newResponse = await ApiCalls.getRequest(url);
    if (newResponse != 'Failed') {
      address = newResponse['results'][0]['formatted_address'];
      Address pickupAddress = Address();
      pickupAddress.latitude = position.latitude;
      pickupAddress.longitude = position.longitude;
      pickupAddress.placeName = address;
      Provider.of<AppData>(context, listen: false)
          .updateUserAddress(pickupAddress);
    }
    return address;
  }

//Directions API call
  static Future<DirectionDetails?> getDirections(
      LatLng startPosition, LatLng endPosition) async {
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${startPosition.latitude},${startPosition.longitude}&destination=${endPosition.latitude},${endPosition.longitude}&mode=driving&key=$apiKey';

    var response = await ApiCalls.getRequest(url);
    if (response == 'failed') {
      return null;
    }
    DirectionDetails directionDetails = DirectionDetails();
    directionDetails.durationText =
        response["routes"][0]["legs"][0]["steps"][0]["duration"]['text'];
    directionDetails.durationValue =
        response["routes"][0]["legs"][0]["steps"][0]["duration"]['value'];
    directionDetails.distanceText =
        response["routes"][0]["legs"][0]["steps"][0]["distance"]['text'];
    directionDetails.distanceValue =
        response["routes"][0]["legs"][0]["steps"][0]["distance"]['value'];
    directionDetails.distanceValue =
        response["routes"][0]["legs"][0]["steps"][0]["distance"]['value'];
    directionDetails.encodedpoint =
        response["routes"][0]['overview_polyline']['points'];
    return directionDetails;
  }
}
