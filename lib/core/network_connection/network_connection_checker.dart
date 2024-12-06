import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class NetworkConnectionChecker {

  NetworkConnectionChecker._();

 static NetworkConnectionChecker instance = NetworkConnectionChecker._();

  ValueNotifier<bool> isConnected = ValueNotifier(false);

  final Connectivity _connectivity = Connectivity();

  Future<void> init() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi) ||
        (result.contains(ConnectivityResult.mobile))){
      isConnected.value=true;
    }
    else{
      isConnected.value=false;
    }
  }

}
