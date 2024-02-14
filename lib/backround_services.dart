import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_bg_service/api_binding.dart';
import 'package:geolocator/geolocator.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
      iosConfiguration: IosConfiguration(
          autoStart: true, onForeground: onStart, onBackground: onBackground),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart, isForegroundMode: true, autoStart: true));
}

//this is for getting current location (Latitude and Longitude)
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}

// this services is for android 
@pragma('vm:entry-point')
void onStart(ServiceInstance serivce) async {
  DartPluginRegistrant.ensureInitialized();
  if (serivce is AndroidServiceInstance) {
    serivce.on('setAsForeground').listen((event) {
      serivce.setAsForegroundService();
    });
    serivce.on('setAsBackground').listen((event) {
      serivce.setAsBackgroundService();
    });
    serivce.on('stopService').listen((event) {
      serivce.stopSelf();
    });
  }
  ApiClient apiClient = ApiClient();

  //hitting api on every second to get the location 
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (serivce is AndroidServiceInstance) {
      if (await serivce.isForegroundService()) {
        determinePosition().then((value) {
          debugPrint('This is Latitude ${value.latitude}');
          debugPrint('This is Longitude ${value.longitude}');
          apiClient
              .sendLatLong(
                  id: 65, latitude: value.latitude, longitude: value.latitude)
              .catchError((onError) => debugPrint('$onError'));
        });
      }
    }
    debugPrint('background service working');
    serivce.invoke('update');
  });
}


// This for IOS For enableing background serivce 
@pragma('vm:entry-point')
Future<bool> onBackground(ServiceInstance serviceInstance) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}
