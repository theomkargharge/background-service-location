import 'dart:async';
import 'dart:ui';
import 'package:dash_bubble/dash_bubble.dart';
import 'package:device_apps/device_apps.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_bg_service/api_binding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:overlay_pop_up/overlay_pop_up.dart';

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
void onStart(ServiceInstance service) async {
  // DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
    service.on('stopService').listen((event) {
      service.stopSelf();
    });
  }
  ApiClient apiClient = ApiClient();

  //hitting api on every second to get the location

  Timer.periodic(const Duration(seconds: 10), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        service.setForegroundNotificationInfo(
            title: 'Background Services is working',
            content: 'Updated At ${DateTime.now()}');

        await DeviceApps.openApp('com.example.flutter_bg_service');

        debugPrint('background service is working');
      }
    }

  });

  final permission = await OverlayPopUp.checkPermission();
  if (permission) {
    if (!await OverlayPopUp.isActive()) {
      await OverlayPopUp.showOverlay(
        width: 300,
        height: 350,
        screenOrientation: ScreenOrientation.portrait,
        closeWhenTapBackButton: false,
        isDraggable: true,
      );
      return;
    } else {
      final result = await OverlayPopUp.closeOverlay();
    }
  } else {
    await OverlayPopUp.requestPermission();
  }
}

// This for IOS For enableing background serivce
@pragma('vm:entry-point')
Future<bool> onBackground(ServiceInstance serviceInstance) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}
