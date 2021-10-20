import 'package:bliss/app/global/colors.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

Future checkNetworkConnection(BuildContext context) async {

  bool status = false;

  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      status = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      status = true;
    } else {
      Toast.show('Please check your internet connection!', context,
          duration: 2, backgroundColor: red);
    }
  } catch (e) {
    print(e);
  }
  return status;
}