import 'package:flutter/cupertino.dart';
import 'package:hot_drop/datamodels/address.dart';

class AppData extends ChangeNotifier {
  Address pickupAddress = Address();
  Address destinationAddress = Address();
  void updateUserAddress(Address userAddress) {
    pickupAddress = userAddress;
    notifyListeners();
  }

  void updateDestinationAddress(Address destination) {
    destinationAddress = destination;
    notifyListeners();
  }
}
