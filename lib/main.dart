import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:overlay_pop_up/overlay_pop_up.dart';

import 'backround_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  runApp(const MyApp());

}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Flutter overlay pop up'),
            backgroundColor: Colors.red[900]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () async {
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
                    setState(() {});
                  }
                },
                color: Colors.red[900],
                child: const Text('Show overlay',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
/// the name is required to be `overlayPopUp` and has `@pragma("vm:entry-point")`
///
@pragma("vm:entry-point")
void overlayPopUp() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverlayWidget(),
    ),
  );
}

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.red[900],
              elevation: 12,
              onPressed: () async {
                await DeviceApps.openApp('com.example.flutter_bg_service');
              },
              child: const Text('Om',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
