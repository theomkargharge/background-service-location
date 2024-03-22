import 'package:flutter/material.dart';

import '../common_textfiled.dart';

class MyDocumentCard extends StatelessWidget {
  final heading, title, hint;
  const MyDocumentCard({super.key, required this.title, required this.heading, required this.hint});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          heading,
          style: const TextStyle(fontSize: 14, color: Color(0xFF606060)),
        ),
        Row(
          children: List.generate(
            2,
                (index) => Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
                height: 95,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20,),
         Text(title, style:const TextStyle(fontSize: 14, color: Color(0xFF606060)),),
         CommonTextField(hintText: hint, width: 390.0, height: 50.0)
      ],
    );
  }
}
