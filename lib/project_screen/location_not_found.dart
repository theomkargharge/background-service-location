import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationNotFound extends StatelessWidget {
  const LocationNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.keyboard_backspace_rounded,
            size: 30,
            color: Color(0xFF707070),
          ),
        ),
        body: Column(
          children: [
            SvgPicture.asset('assets/locationnotfound.svg'),
            const Center(
              child: Text(
                'Location not Found',
                style: TextStyle(fontSize: 22, color: Color(0xFF303030)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Application denied, to continue... Please allow the location permission.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF02011A),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 50,
                width: 390,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Go to settings',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
