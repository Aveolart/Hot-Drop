import 'package:flutter/cupertino.dart';
import 'package:hot_drop/datamodels/address.dart';

class AppData extends ChangeNotifier {
  Address pickupAddress = Address();
  void updateUserAddress(Address userAddress) {
    pickupAddress = userAddress;
    notifyListeners();
  }
}
