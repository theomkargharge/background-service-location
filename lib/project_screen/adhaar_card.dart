import 'package:flutter/material.dart';

import '../common_textfiled.dart';

class AadhaarCard extends StatelessWidget {
  const AadhaarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.keyboard_backspace_rounded,
          size: 30,
          color: Color(0xFF707070),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aadhar Card',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF707070)),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Upload Aadhaar Photo',
              style: TextStyle(fontSize: 14, color: Color(0xFF606060)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 95,
                    width: 185,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF3F3F3),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'FRONT',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFAAAAAA)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 95,
                    width: 185,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF3F3F3),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'BACK',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFAAAAAA)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Aadhaar Number',
              style: TextStyle(fontSize: 14, color: Color(0xFF606060)),
            ),
            const CommonTextField(
                hintText: 'Enter Aadhaar Number', width: 390.0, height: 50.0),
            const Spacer(),
            SizedBox(
              height: 50,
              width: 376,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
