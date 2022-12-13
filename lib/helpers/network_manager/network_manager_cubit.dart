import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_manager_state.dart';

class NetworkManagerCubit extends Cubit<NetworkManagerState> {
  NetworkManagerCubit()
      : super(const NetworkManagerState(
            isConnected: false, type: ConnectionType.offline));
  NetworkManagerState _status = const NetworkManagerState(
      isConnected: false, type: ConnectionType.offline);

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool get isConnected => _status.isConnected;
  ConnectionType get connectionType => _status.type;

  Future<void> startMonitoring() async {
    emit(_status);
    await initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> stopMonitoring() {
    return _connectivitySubscription.cancel();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      _status = const NetworkManagerState(
          isConnected: false, type: ConnectionType.offline);
      emit(_status);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        _status = const NetworkManagerState(
            isConnected: true, type: ConnectionType.wifi);
        print(_status);
        emit(_status);
        break;
      case ConnectivityResult.mobile:
        _status = const NetworkManagerState(
            isConnected: true, type: ConnectionType.mobile);
        print(_status);
        emit(_status);
        break;
      default:
        _status = const NetworkManagerState(
            isConnected: false, type: ConnectionType.offline);
        print(_status);
        emit(_status);
        break;
    }
  }
}
