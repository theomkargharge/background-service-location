import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bg_service/backround_services.dart';
import 'package:flutter_overlay_apps/flutter_overlay_apps.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Latitude;
  var Longitude;

  @override
  void initState() {
    determinePosition().then((value) {
      setState(() {
        Latitude = value.latitude;
        Longitude = value.longitude;
      });
    });
    super.initState();
  }

  String text = 'Stop Serivce';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'LatLng',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(colors: [
                        Colors.blue,
                        Colors.red,
                      ])),
                  height: 150,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'This is Latitude $Latitude',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'This is Longitude $Longitude',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )),
            ),
            // this is for starting the backround services for android
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        FlutterBackgroundService().invoke("setAsForeground");
                      },
                      child: const Text(
                        'Foreground Service',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        FlutterBackgroundService().invoke(
                          'setAsBackground',
                        );
                      },
                      child: const Text(
                        'Background Service',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  onPressed: () async {
                    final service = FlutterBackgroundService();
                    bool isRunning = await service.isRunning();
                    if (isRunning) {
                      service.invoke('stopService');
                    } else {
                      service.startService();
                    }
                    if (!isRunning) {
                      text = 'Stop Service';
                    } else {
                      text = 'Start Service';
                    }
                    setState(() {});
                  },
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )),
            ),

            ElevatedButton(onPressed: () async{
              await FlutterOverlayApps.showOverlay(
                  height: 45,
                  width: 45,

                  alignment: OverlayAlignment.center);

            }, child: const Text('showOverlay'))
            // SvgPicture.asset('assets/Iconback.svg'),
            // ElevatedButton(
            //     onPressed: () async {
            //         await requestOverlay();
            //     },
            //     child: Text('Start Bubble')),
            // ElevatedButton(
            //     onPressed: () async {
            //         await DashBubble.instance.stopBubble();
            //     },
            //     child: Text('Stop Bubble'))
          ],
        ),
      )),
    );
  }
}

/*await FlutterOverlayWindow.requestPermission();
                  final bool status =
                      await FlutterOverlayWindow.isPermissionGranted();
                  if (status) {
                    await FlutterOverlayWindow.showOverlay(
                      overlayTitle: 'overlay title',
                      enableDrag: true,

                      flag: OverlayFlag.defaultFlag,
                      visibility: NotificationVisibility.visibilityPublic,
                      positionGravity: PositionGravity.auto,
                      height: 100,
                      width: 50,
                    );
                  }*/
