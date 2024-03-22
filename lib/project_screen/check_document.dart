import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckDocument extends StatelessWidget {
  const CheckDocument({super.key});

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
            SvgPicture.asset('assets/svg1.svg'),
            const Center(
              child: Text(
                'Documents Under Verification',
                style: TextStyle(fontSize: 22, color: Color(0xFF303030)),
              ),
            ),
            const SizedBox(height: 15,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla est risus, dignissim sit amet fringilla quis, lobortis in augue.,',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF707070),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(height: 50,  width: 390, child: ElevatedButton(onPressed: (){},child: const Text('Check Documents', style: TextStyle(fontSize: 18, color: Colors.white),),),),
            )
          ],
        ),
      ),
    );
  }
}
