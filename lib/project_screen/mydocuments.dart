import 'package:flutter/material.dart';
import 'package:flutter_bg_service/common_textfiled.dart';
import 'package:flutter_bg_service/project_screen/common_document_card.dart';

import 'my_document_card.dart';

class MyDocument extends StatelessWidget {
  const MyDocument({super.key});

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Documents',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF707070)),
              ),
              SizedBox(height: 30,),
              MyDocumentCard(
                title: 'Driving License Number',
                heading: 'Driving License',
                hint: 'DL Number',
              ),
              MyDocumentCard(
                title: 'Vehicle Registration Number',
                heading: 'Vehicle RC Photo',
                hint: 'MH 12 GF 2091',
              ),
              MyDocumentCard(
                title: 'Aadhaar Card Number',
                heading: 'Aadhaar Card',
                hint: '1542 5648 6542',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
